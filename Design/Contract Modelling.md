# Contract Modelling

---

## Registration Service: Port 8001

GET /divisions: () -> Division[]
GET /login: (BasicAccessAuth in Header) -> { Id, Name, Organization, DivisionName }: TeamReadModel [Protocol](https://en.wikipedia.org/wiki/Basic_access_authentication)

POST /register: ({ Name, PasswordHash, Organization, DivisionId }: TeamWriteModel) -> HTTPResponse

### Do Not Expose To External Systems (API Gateway and Docker will accomplish this)

GET /team/{Id}: () -> { Id, Name, Organization, DivisionName }: TeamReadModel
GET /{divisionId}/teams: () -> { Id, Name, Organization, DivisionName }[]: TeamReadModel[]

---

## Submission Service: Port 8002

GET /{teamId}/submissions: () -> Submission[]
GET /supported-languages: () -> Language[]
GET /{submissionId}/submission-code: () -> File

POST /{teamId}/submit/{languageId}: (File) -> Submission
POST /{teamId}/submitTest/{languageId}: (File) -> Submission
POST /{submissionId}/make-active: () -> HTTPResponse

### Do Not Expose To External Systems (API Gateway and Docker will accomplish this)

GET /{divisionId}/active-submissions: () -> Submission[]

---

## Testing Service: Port 8003

WEBSOCKET /: Events::SUB["test-submissions": (TeamId, Submission[])], Events::PUB["completed": (TestGameWTeamsNResults)]

POST /{gameId}/{turnNumber}: (GameStateJson, DebugLog[]) -> HTTPResponse ???RABITMQ???
POST /{gameId}/{teamId}: (score) -> HTTPResponse ???RABITMQ???

RABBITMQ SUB: ({ TestGameId }: CompletedTestGame)
RABBITMQ PUB: ({ TestGameId, TeamId, Submission[] }: StartTestGame)

---

## Announcement Service: Port 8004, 8005

WEBSOCKET(8005) /: Events::PUB["Announce"]

GET(8004) /: () -> Announcement

POST(8004) /: ({Title, Message, Level}: AnnouncementWriteModel) -> HTTPResponse

RABBITMQ SUB: (AnnouncementWriteModel)

---

## Tournament Service: Port 8006

GET /{divisionId}/latest-tournament: () -> Tournament
GET /{tournamentId}/leaderboard: () -> TournamentResult[]

POST /{gameId}/{turnNumber}: (GameStateJson) -> HTTPResponse ???RABITMQ???
POST /{gameId}/{teamId}: (score) -> HTTPResponse ???RABITMQ???

RABBITMQ SUB: (StartTournament, { GameId }: CompletedGame)

RABBITMQ PUB: ({ GameId, Submissions[] }: StartGame)

---
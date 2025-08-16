# Contract Modelling

---

## Registration Service: Port 8001, 8002

GET /divisions: () -> Division[]
GET /login: (BasicAccessAuth in Header) -> { Id, Name, Organization, DivisionName }: TeamReadModel [Protocol](https://en.wikipedia.org/wiki/Basic_access_authentication)

POST /register: ({ Name, PasswordHash, Organization, DivisionId }: TeamWriteModel) -> HTTPResponse

### Do Not Expose To External Systems (API Gateway and Docker will accomplish this)

GET /team/{Id}: () -> { Id, Name, Organization, DivisionName }: TeamReadModel
GET /{divisionId}/teams: () -> { Id, Name, Organization, DivisionName }[]: TeamReadModel[]

---

## Submission Service: Port 8003, 8004

GET /{teamId}/submissions: () -> Submission[]
GET /supported-languages: () -> Language[]
GET /{submissionId}/submission-code: () -> File

POST /{teamId}/submit/{languageId}: (File) -> Submission
POST /{teamId}/submitTest/{languageId}: (File) -> Submission
POST /{submissionId}/make-active: () -> HTTPResponse

### Do Not Expose To External Systems (API Gateway and Docker will accomplish this)

GET /{divisionId}/active-submissions: () -> Submission[]

---

## Testing Service: Port 8005, 8006

WEBSOCKET /: Events::SUB["test-submissions": (TeamId, Submission[])], Events::PUB["completed": (TestGameWTeamsNResults)]

POST /{gameId}/{turnNumber}: (GameStateJson, DebugLog[]) -> HTTPResponse ???RABITMQ???
POST /{gameId}/{teamId}: (score) -> HTTPResponse ???RABITMQ???

RABBITMQ SUB: ({ GameId }: CompletedTestGame)
RABBITMQ PUB: ({ GameId, TeamId, Submission[] }: StartTestGame)

---

## Announcement Service: Port 8007, 8008

WEBSOCKET(8008) /: Events::PUB["Announce"]

GET(8007) /: () -> Announcement

POST(8007) /: ({Title, Message, Level}: AnnouncementWriteModel) -> HTTPResponse

RABBITMQ SUB: (AnnouncementWriteModel)

---

## Tournament Service: Port 8009, 8010

GET /{divisionId}/latest-tournament: () -> Tournament
GET /{tournamentId}/leaderboard: () -> TournamentResult[]

POST /{gameId}/{turnNumber}: (GameStateJson) -> HTTPResponse ???RABITMQ???
POST /{gameId}/{teamId}: (score) -> HTTPResponse ???RABITMQ???

RABBITMQ SUB: (StartTournament, { GameId }: CompletedGame)

RABBITMQ PUB: ({ GameId, Submissions[] }: StartGame)

---

## Scheduling Service: Port 8011, 8012

WEBSOCKET(8012) /: Events::PUB["Announce", "StartTournament" "StartCompetition", "EndCompetition", "EnableSubmissions", "DisableSubmissions"]

RABBITMQ PUB: (StartTournament, AnnouncementWriteModel, StartCompetition, EnableSubmissions, DisableSubmissions, EndCompetition)

---

## Orchestration Service: Port 8013, 8014
Create Match Cluster of HUB, game engine, client for each submission 

POST /create-test-game: (GameId, TeamId, Submissions[]) -> HTTPResponse

POST /create-tournament-game: (GameId, Submissions[]) -> HTTPResponse

WEBSOCKET(8014) 

RABBITMQ SUB: ({ GameId, Submissions[] }: StartGame, { GameId, TeamId, Submission[] }: StartTestGame, { GameId }: CompletedGame, { GameId }: CompletedTestGame)

---

## Hub Template: HTTP Port, RabbitMQ Port

WEBSOCKET(RabbitMQ) /rabbitmq: Events::PUB["CompletedGame", "CompletedTestGame"]

RABBITMQ PUB: ({ GameId }: CompletedGame, { GameId }: CompletedTestGame)

HTTP PUB: (EngineLoadBoardRequest, EngineLoadClientsRequest, EngineTickRequest, EngineGameStateRequest, EngineEndRequest, EngineGetResultsRequest, ClientLoadRequest, ClientTickRequest, ClientEndRequest, ClientDebugLogsRequest)

HTTP PUB: (EngineLoadBoardResponse, EngineLoadClientsResponse, EngineTickResponse, EngineGameStateResponse, EngineEndResponse, EngineGetResultsResponse, ClientLoadResponse, ClientTickResponse, ClientEndResponse, ClientDebugLogsResponse)
---

## GameEngine Template: HTTP Port

WEBSOCKET /: 

Events::PUB["EngineLoadBoardResponse", "EngineLoadClientsResponse", "EngineTickResponse", "EngineGameStateResponse", "EngineEndResponse", "EngineGetResultsResponse"], 

Events::SUB["EngineLoadBoardRequest", "EngineLoadClientsRequest", "EngineTickRequest", "EngineGameStateRequest", "EngineEndRequest", "EngineGetResultsRequest"]

---

## Client Template: HTTP Port

WEBSOCKET /: 

Events::PUB["ClientLoadRequest", "ClientTickRequest", "ClientEndRequest", "ClientDebugLogsRequest"], 

Events::SUB["ClientLoadResponse", "ClientTickResponse", "ClientEndResponse", "ClientDebugLogsResponse"]

---
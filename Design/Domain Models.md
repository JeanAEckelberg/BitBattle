# Domain Models

---

```puml

@startuml

object "Division" as d {
    Id: int
    Name: nvarchar(50)
}

object "Language" as l {
    Id: int
    Name: nvarchar(20)
}

object "Team" as tm {
    Id: int
    Name: nvarchar(50)
    Organization: nvarchar(50)
    DivisionId: int
    PasswordHash: nvarchar(100)
}

object "Submission" as s {
    Id: int
    TeamId: int
    LanguageId: int
    FilePath: nvarchar(255)
    SubmissionUtcDateTime: datetime2
    IsActive: bit
}

object "Announcement" as a {
    Id: int
    Title: nvarchar(100)
    Message: nvarchar(511)
    LevelId: int
}

object "AnnouncementLevel" as al {
    Id: int
    Name: nvarchar(20)
}


object "Tournament" as tt {
	Id: int
	StartUtcDateTime: datetime2
	IsFinished: bit
	DivisionId: int
}

object "TournamentResult" as tr {
	Id: int
	TournamentId: int
	TeamId: int
	SubmissionId: int
	Score: decimal(14,4)
}

object "Match" as m {
	Id: int
	TournamentId: int
	StartUtcDateTime: datetime2
	EndUtcDateTime: datetime2
}

object "MatchResult" as mr {
	Id: int
	MatchId: int
	TeamId: int
	Score: decimal(14,4)
}

object "Game" as g {
    Id: int
	StartUtcDateTime: datetime2
	EndUtcDateTime: datetime2
}

object "GameResult" as gr {
    Id: int
    GameId: int
    TeamId: int
	Score: decimal(14,4)
}

object "GameStateLog" as gsl {
    Id: int
    GameId: int
    TurnNumber: int
    GameStateJson: nvarchar(max)
}

object "TournamentGame" as tg {
    Id: int
    MatchId: int
}

object "DebugLog" as dl {
    Id: int
    GameStateLogId: int
    TeamId: int
    InsertUtcDateTime: datetime2
    Message: nvarchar(255)
}


d ||--o{ tm
d ||--o{ tt 

al ||--o{ a

l ||--o{ s

tm ||--o{ s
tm ||--o{ tr
tm ||--o{ mr
tm ||--o{ gr
tm ||--o{ dl

s ||--o{ tr

tt ||--o{ tr
tt ||--o{ m

m ||--o{ mr
m ||--o{ tg

g ||--o| tg
g ||--o{ gr
g ||--o{ gsl

gsl ||--o{ dl

@enduml

```

---

**Division**

- Id
- Name

---

**Language**

- Id
- Name

---

**Team**

- Id
- Name
- Organization
- Division
- Password
- Submissions

---

**Submission**

- Id
- TeamId
- Language
- FileLocation
- SubmissionDateTime
- IsActive

---

**Announcement**

- Id
- Title
- Message
- Level

---

**Tournament**

- Id
- StartDateTime
- IsFinished
- Division
- Matches
- Teams
- Submissions

**TournamentResult**

- Id
- TournamentId
- TeamId
- SubmissionId
- Score

---

**Match**

- Id
- TournamentId
- StartDateTime
- EndDateTime
- Teams
- Games
- MatchResults

**MatchResult**

- Id
- MatchId
- TeamId
- Score

---

**TournamentGame**

- Id
- MatchId
- StartDateTime
- EndDateTime
- Teams
- Results

**TournamentGameResult**

- Id
- GameId
- TeamId
- Score

**TournamentGameStateLog**

- Id
- GameId
- TurnNumber
- GameStateJson

---

**TestGame**

- Id
- StartDateTime
- EndDateTime
- Teams
- Results

**TestGameResult**

- Id
- TestGameId
- TeamId
- Score

**TestGameStateLog**

- Id
- TestGameId
- TurnNumber
- GameStateJson
- DebugLogs

**DebugLog**

- Id
- TestGameId
- TurnNumber
- TeamId
- InsertDateTime
- Message

---
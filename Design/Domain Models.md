# Domain Models

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

**Announcement**

- Id
- Title
- Message
- Level

---

**Submission**

- Id
- TeamId
- Language
- FileLocation
- SubmissionDateTime
- IsActive

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

**Game**

- Id
- MatchId
- StartDateTime
- EndDateTime
- Teams
- Results

**GameResult**

- Id
- GameId
- TeamId
- Score

**GameStateLogs**

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

**TestGameStateLogs**

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
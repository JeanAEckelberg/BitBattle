<!-- omit in toc -->
# User Stories

- [Resources](#resources)
- [Structure](#structure)
- [Non Users](#non-users)
  - [System Developer --DONE](#system-developer---done)
- [Prior To Competition](#prior-to-competition)
  - [Competition Artist --DONE](#competition-artist---done)
  - [Competition Developer --DONE](#competition-developer---done)
  - [Competition Playtester --DONE](#competition-playtester---done)
- [During Competition](#during-competition)
  - [Competition DBA --NEEDS REVIEW](#competition-dba---done)
  - [Competition Host --DONE](#competition-host---done)
  - [Competitor --DONE](#competitor---done)
  - [Spectator --DONE](#spectator---done)

---

## Resources

[User Story Blog](https://maze.co/blog/user-story/)

---

## Structure

**Story Format:** "As a [type of user], I want to [perform an action], so that I can [achieve a benefit]."

Create Acceptance Criteria using 3 C's

- **Card** - The two-three sentences used to describe the intent of the user.
- **Conversation** - A discussion between the target users, team, product owner, and other stakeholders to determine the more detailed behavior required to implement the intent.
- **Confirmation** - How the customer or product owner will confirm that the story has been implemented to their satisfaction.

---

## Non Users

### System Developer --DONE

- As a [System Developer](./Actors.md#system-developer), I want system [components](../Definitions.md#component) to be well-defined and decoupled, so that changes have minimal impact on the surrounding components.

- As a [System Developer](./Actors.md#system-developer), I want an easy way to build and run the system, so that I can test and validate my changes easily.

- As a [System Developer](./Actors.md#system-developer), I want comprehensive tests, so that changes are validated and do not have unintended side effects.

- As a [System Developer](./Actors.md#system-developer), I want access to fleshed-out user telemetry, so that I can prioritize the user issues to be addressed.

- As a [System Developer](./Actors.md#system-developer), I want access to standardized and well-defined error logging, so that I can use it to guide further development.

- As a [System Developer](./Actors.md#system-developer), I want to know the expected features of a standard [competition](../Definitions.md#competition), so that I can understand the scope of the project.

---

## Prior To Competition

### Competition Artist --DONE

- As a [Competition Artist](./Actors.md#competition-artist), I want an easy, clear way to integrate my art assets into a [competition](../Definitions.md#competition) so that, I don't have to know about the internal behavior of the [engine](../Definitions.md#engine).

---

### Competition Developer --DONE

- As a [Competition Developer](./Actors.md#competition-developer), I want to have stable API definitions, so that contracts do not have to be re-written frequently.

- As a [Competition Developer](./Actors.md#competition-developer), I want well defined boundaries for [engine](../Definitions.md#engine) and [client](../Definitions.md#client) behavior, so that adding new [clients](../Definitions.md#client) is a standardized process.

- As a [Competition Developer](./Actors.md#competition-developer), I want to be able to see metrics and logs to inform me of any potential issues, so that I can act on them before the [competition](../Definitions.md#competition) starts.

- As a [Competition Developer](./Actors.md#competition-developer), I want the development of [game](../Definitions.md#game) logic to be language agnostic, so that I can use a language I am familiar with.

- As a [Competition Developer](./Actors.md#competition-developer), I want support for multiple [game](../Definitions.md#game) types (co-op, turn-based, PvE, etc), so that I can create the style of [game](../Definitions.md#game) that I want.

- As a [Competition Developer](./Actors.md#competition-developer), I want support for different [tournament](../Definitions.md#tournament) methods (round-robin, elimination, high score), so that I can create the style of [tournament](../Definitions.md#tournament) that I want.

- As a [Competition Developer](./Actors.md#competition-developer), I want to keep my dependencies minimal, so that I can instantiate the server quickly.

- As a [Competition Developer](./Actors.md#competition-developer), I don't want to have to worry about how the [client](../Definitions.md#client) and [game engine](../Definitions.md#engine) connect, so that I can focus on developing the [game](../Definitions.md#game) challenges.

- As a [Competition Developer](./Actors.md#competition-developer), I want to be able to provide [Competitors](./Actors.md#competitor) with a library of [game actions](../Definitions.md#action), so that their development can be made easier through autocomplete features such as IntelliSense®.

- As a [Competition Developer](./Actors.md#competition-developer), I want to be able to specify a retention policy for [submissions](../Definitions.md#submission), so that I can have the [system](../Definitions.md#system) align to requirements and limitations (e.g. storage constraints).

- As a [Competition Developer](./Actors.md#competition-developer), I want an easy, standard way to integrate art assets into the play area, so that I can make the game look nice for [Spectators](./Actors.md#spectator)

---

### Competition Playtester --DONE

- As a [Competition Playtester](./Actors.md#competition-playtester), I want to have debugging tools in the visualizer, so that I can easily identify and share actionable development insights.

- As a [Competition Playtester](./Actors.md#competition-playtester), I want an easy way to replay or quickly iterate previous [matches](../Definitions.md#match), so that I can isolate and revisit potential issues.

- As a [Competition Playtester](./Actors.md#competition-playtester), I want to be able to export [match](../Definitions.md#match) data, so that I can provide comprehensive information to the [Competition Developers](./Actors.md#competition-developer).

---

## During Competition

### Competition DBA --DONE

- As a [Competition DBA](./Actors.md#competition-dba), I want to be able to make changes to data while the [competition](../Definitions.md#competition) is running, so that I can fix issues as they arise.

- As a [Competition DBA](./Actors.md#competition-dba), I want [competitors](./Actors.md#competitor) to be able to self-service common data issues (i.e. password reset), so that I can focus on more complex issues.

- As a [Competition DBA](./Actors.md#competition-dba), I want to be able to safely query data throughout the [competition](../Definitions.md#competition), so I can report on information while the [competition](../Definitions.md#competition) is running.

- As a [Competition DBA](./Actors.md#competition-dba), I want a well defined database schema storing [competition](../Definitions.md#competition) data (see [Database Requirements](./Database.md)), so that the [competition](../Definitions.md#competition) can be administered. 

---

### Competition Host --DONE

- As a [Competition Host](./Actors.md#competition-host), I want to be able to observe issues without the need for manual reporting so that I can respond to issues quicker and ensure a smooth [Competitor](./Actors.md#competitor) experience.

- As a [Competition Host](./Actors.md#competition-host), I want a quick and easy method to patch and redeploy different [containers](../Definitions.md#container) without information loss, so that [containers](../Definitions.md#container) can be changed with minimal interference to the [competition](../Definitions.md#competition).

- As a [Competition Host](./Actors.md#competition-host), I want a live [feed](../Definitions.md/#feed) of [matches](../Definitions.md#match), so that the [spectators](./Actors.md#spectator) have a means of follow along with the [competition](../Definitions.md#competition).

- As a [Competition Host](./Actors.md#competition-host), I want to be able to schedule key [competition](../Definitions.md#competition) events and announcements to occur without writing specific code, so that I can set the pace of the [competition](../Definitions.md#competition) without additional technical burden.

- As a [Competition Host](./Actors.md#competition-host), I want an easy way to send announcements to [competitors](./Actors.md#competitor) and/or [spectators](./Actors.md#spectator), so that I can quickly [promulgate](https://www.merriam-webster.com/dictionary/promulgate) competition information.

- As a [Competition Host](./Actors.md#competition-host), I want to know what category a [team](../Definitions.md#team) belongs to, so that I can award different prize categories.


---

### Competitor --DONE

- As a [Competitor](./Actors.md#competitor), I want to be able to upload a [submission](../Definitions.md#submission) at any time during the [competition](../Definitions.md#competition), so that I can choose when I upload and when I work.

- As a [Competitor](./Actors.md#competitor), I want to be able to retrieve previous [submissions](../Definitions.md#submission), so that I can recover quickly if I fail to maintain version control.

- As a [Competitor](./Actors.md#competitor), I want documentation regarding the [competition](../Definitions.md#competition) and the [game](../Definitions.md#game) to be readily accessible to me, so that I can easily develop my [submission](../Definitions.md#submission) in accordance with established parameters.

- As a [Competitor](./Actors.md#competitor), I want to test a [test submission](../Definitions.md#test-submission) against any of my [submissions](../Definitions.md#submission) or another [test submission](../Definitions.md#test-submission) I specify, so I can test possible [submissions](../Definitions.md#submission) with more pertinent information (logs).

- As a [Competitor](./Actors.md#competitor), I want a way to specify whether my [current submission](../Definitions.md#current-submission) or [highest-scoring submission](../Definitions.md#highest-scoring-submission) should be used for the final [tournament](../Definitions.md#tournament), so that I can use a [submission](../Definitions.md#submission) even if an extra [tournament](../Definitions.md#tournament) doesn't have time to run before the final [tournament](../Definitions.md#tournament).

- As a [Competitor](./Actors.md#competitor), I want to view logged information at different levels of detail about my [test submission](../Definitions.md#test-submission) and the [game](../Definitions.md#game) state.
  
- As a [Competitor](./Actors.md#competitor), I want to see any interaction errors or unexpected failures occurring with [match](../Definitions.md#match) infrastructure, so that I can take actions on [engine](../Definitions.md#engine)-breaking behavior.

- As a [Competitor](./Actors.md#competitor), I want to be able to watch a visual representation of a [match](../Definitions.md#match), so that I can gain deeper insight into my [bot](../Definitions.md#bot)'s performance in [tournament](../Definitions.md#tournament) [matches](../Definitions.md#match).

- As a [Competitor](./Actors.md#competitor), I want the ability to step through each [tick](../Definitions.md#tick) of a test [replay](../Definitions.md#replay) including logs and visuals, so that I can better understand my [bot](../Definitions.md#bot)'s behavior.

---

### Spectator --DONE

- As a [Spectator](./Actors.md#spectator), I want to be able to navigate [matches](../Definitions.md#match) so that I can find [match](../Definitions.md#match) metadata and [replays](../Definitions.md#replay) I care about.

- As a [Spectator](./Actors.md#spectator), I want a way to view previous [matches](../Definitions.md#match), so that I can see how [competitors'](./Actors.md#competitor) [bots](../Definitions.md#bot) have changed and developed over time.

- As a [Spectator](./Actors.md#spectator), I want a live feed of [matches](../Definitions.md#match), so that I can view a shared visual state of the competition.

- As a [Spectator](./Actors.md#spectator), I want a [leaderboard](../Definitions.md#leaderboard), so that I can see how each [team](../Definitions.md#team) is performing.

---

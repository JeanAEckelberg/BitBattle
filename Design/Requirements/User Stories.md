<!-- omit in toc -->
# User Stories

- [Resources](#resources)
- [Structure](#structure)
- [Non Users](#non-users)
  - [System Developer](#system-developer)
- [Prior To Competition](#prior-to-competition)
  - [Competition Artist](#competition-artist)
  - [Competition Developer](#competition-developer)
  - [Competition Playtester](#competition-playtester)
- [During Competition](#during-competition)
  - [Competition DBA](#competition-dba)
  - [Competition Host](#competition-host)
  - [Competitor](#competitor)
  - [Spectator](#spectator)

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

### System Developer

- As a [System Developer](./Actors.md#system-developer), I want system components to be well-defined and decoupled, so that changes have minimal impact on the surrounding components.
- As a [System Developer](./Actors.md#system-developer), I want an easy way to build and run the system, so that I can test and validate my changes easily.
- As a [System Developer](./Actors.md#system-developer), I want comprehensive tests, so that changes are validated and do not have unintended side effects.
- As a [System Developer](./Actors.md#system-developer), I want access to fleshed-out user telemetry, so that I can prioritize the user issues to be addressed.
- As a [System Developer](./Actors.md#system-developer), I want access to standardized and well-defined error logging, so that I can use it to guide further development.
- As a [System Developer](./Actors.md#system-developer), I want to know the expected features of a standard [competition](../Definitions.md#competition), so that I can understand the scope of the project.

---

## Prior To Competition

### Competition Artist

```markdown

- As a [Competition Artist](./Actors.md#competition-artist), I want an easy, clear interface, so that I can make and upload art without worrying about the internal behavior of the engine.
- As a [Competition Artist](./Actors.md#competition-artist), I want to have minimal interaction with the engine, so that I can focus on the art, interface, and layout.

```

---

### Competition Developer

- As a [Competition Developer](./Actors.md#competition-developer), I want to have stable API definitions, so that contracts do not have to be re-written frequently.
- As a [Competition Developer](./Actors.md#competition-developer), I want well defined boundaries for engine and client behavior, so that adding new clients is a standardized process.
- As a [Competition Developer](./Actors.md#competition-developer), I want to be able to see metrics and logs to inform me of any potential issues, so that I can act on them before the [competition](../Definitions.md#competition) starts.
- As a Competition Developer, I want the development of [game](../Definitions.md#game) logic to be language agnostic, so that I can use a language I am familiar with.
- As a Competition Developer, I want support for multiple [game](../Definitions.md#game) types (co-op, turn-based, etc), so that I can create the style of [game](../Definitions.md#game) that I want.
- As a [Competition Developer](./Actors.md#competition-developer), I want support for different [tournament](../Definitions.md#tournament) methods (such as round-robin & elimination), so that I can create the style of [tournament](../Definitions.md#tournament) that I want.
- As a [Competition Developer](./Actors.md#competition-developer), I want to keep my dependencies minimal, so that I can create the server quickly.
- As a [Competition Developer](./Actors.md#competition-developer), I don't want to have to worry about how the client and [game](../Definitions.md#game) engine connect, so that I can focus on developing the [game](../Definitions.md#game) challenges.
- As a [Competition Developer](./Actors.md#competition-developer), I want to be able to provide [Competitors](./Actors.md#competitor) with a library of [game](../Definitions.md#game) [actions](../Definitions.md#action), so that their development can be made easier through autocomplete features such as IntelliSense.

---

### Competition Playtester

- As a [Competition Playtester](./Actors.md#competition-playtester), I want to have debugging tools in the visualizer, so that I can easily identify and share actionable development insights.
- As a [Competition Playtester](./Actors.md#competition-playtester), I want an easy way to replay or quickly iterate previous [matches](../Definitions.md#match), so that I can isolate and revisit potential issues.
- As a [Competition Playtester](./Actors.md#competition-playtester), I want to be able to export [match](../Definitions.md#match) replay data, so that I can provide comprehensive information to the [Competition Developers](./Actors.md#competition-developer).

---

## During Competition

### Competition DBA

```markdown

1: As a [Competition DBA](./Actors.md#competition-dba), I want to make quick changes to data, so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to make quick changes to data, so that _____.

---

2: As a [Competition DBA](./Actors.md#competition-dba), I want to be able to query data throughout the [competition](../Definitions.md#competition) so I can report on information on the fly.

As a [Competition DBA](./Actors.md#competition-dba), I want to be able to query data throughout the [competition](../Definitions.md#competition) so I can report on information on the fly.

---

3: As a [Competition DBA](./Actors.md#competition-dba), I want to be able commit data changes while the application is running, so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to be able commit data changes while the application is running, so that _____.

---

4: As a [Competition DBA](./Actors.md#competition-dba), I want to store the [teams](../Definitions.md#team) that are competing, so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to store the [teams](../Definitions.md#team) that are competing, so that _____.

---

5: As a [Competition DBA](./Actors.md#competition-dba), I want to store the [games](../Definitions.md#game) and points awarded to the [teams](../Definitions.md#team), so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to store the [games](../Definitions.md#game) and points awarded to the [teams](../Definitions.md#team), so that _____.

---

6: As a [Competition DBA](./Actors.md#competition-dba), I want to know which [teams](../Definitions.md#team) are competing in a [game](../Definitions.md#game), so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to know which [teams](../Definitions.md#team) are competing in a [game](../Definitions.md#game), so that _____.

---

7: As a [Competition DBA](./Actors.md#competition-dba), I want to see the changes in the GameState during a [game](../Definitions.md#game) so that it can be visualized.

As a [Competition DBA](./Actors.md#competition-dba), I want to see the changes in the GameState during a [game](../Definitions.md#game) so that it can be visualized.

---

8: As a [Competition DBA](./Actors.md#competition-dba), I want to know what organization each [team](../Definitions.md#team) is from, so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to know what organization each [team](../Definitions.md#team) is from, so that _____.

---

9: As a [Competition DBA](./Actors.md#competition-dba), I want to know the organizations competing in this [competition](../Definitions.md#competition), so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to know the organizations competing in this [competition](../Definitions.md#competition), so that _____.

---

10: As a [Competition DBA](./Actors.md#competition-dba), I want to know what category a [team](../Definitions.md#team) belongs to, so that I can award different prize categories.

As a [Competition DBA](./Actors.md#competition-dba), I want to know what category a [team](../Definitions.md#team) belongs to, so that I can award different prize categories.

---

11: As a [Competition DBA](./Actors.md#competition-dba), I want to be able to see the results of a specific [tournament](../Definitions.md#tournament), so that _____.

As a [Competition DBA](./Actors.md#competition-dba), I want to be able to see the results of a specific [tournament](../Definitions.md#tournament), so that _____.

---

```

### Competition Host

```markdown

1: As a [Competition Host](./Actors.md#competition-host), I want to be able to see if anyone is having issues without them reporting it so that I can respond to issues quicker.

As a [Competition Host](./Actors.md#competition-host), I want to be able to see if anyone is having issues without them reporting it so that I can respond to issues quicker.

---

2: As a [Competition Host](./Actors.md#competition-host), I want a quick and easy method to patch and redeploy different components without information loss, so that _____.

As a [Competition Host](./Actors.md#competition-host), I want a quick and easy method to patch and redeploy different components without information loss, so that _____.

---

```

### Competitor

- As a [Competitor](./Actors.md#competitor), I want to be able to upload a [submission](../Definitions.md#submission) at any time during the [competition](../Definitions.md#competition), so that I can choose when I upload and when I work.
- As a [Competitor](./Actors.md#competitor), I want to be able to retrieve previous [submissions](../Definitions.md#submission), so that I can recover quickly if I fail to maintain version control.
- As a [Competitor](./Actors.md#competitor), I want to be able to select a previous [submission](../Definitions.md#submission) as my [active submission](../Definitions.md#active-submission), so that I don't have to upload a [submission](../Definitions.md#submission) that has the same functionality as an earlier one. can get information about crashes or unintended behavior.
- As a [Competitor](./Actors.md#competitor), I want documentation regarding the [competition](../Definitions.md#competition) and the [game](../Definitions.md#game) to be readily accessible to me, so that I can easily develop my [submission](../Definitions.md#submission) in accordance with established parameters.

```markdown

As a [Competitor](./Actors.md#competitor), I want:

- to test a [test submission](../Definitions.md#test-submission) against my [active submission](../Definitions.md#active-submission) or another [test submission](../Definitions.md#test-submission)
- to test an [active submission](../Definitions.md#active-submission) against another [active submission](../Definitions.md#active-submission)
  - A [competitor](./Actors.md#competitor)
  - A random [submission](../Definitions.md#submission)
  - A random [active submission](../Definitions.md#active-submission)
- to log information at different levels about my [submission](../Definitions.md#submission) and the [game](../Definitions.md#game) state
- re-observe that log information [tick](../Definitions.md#tick) by [tick](../Definitions.md#tick)
- see any interaction errors or unexpected failures occurring with match infrastructure (NOT ANOTHER [SUBMISSION](../Definitions.md#SUBMISSION)'S LOGS)

---

, so that I cna an visually understand my [submission](../Definitions.md#submission)'s behavior.
As a [Competitor](./Actors.md#competitor), I want to be able to watch a visual representation of a [match](../Definitions.md#match)

```

---

### Spectator

``` markdown

1: As a [Spectator](./Actors.md#spectator), I want an easy way to view [games](../Definitions.md#game) I want to see, so that _____.

As a [Spectator](./Actors.md#spectator), I want an easy way to view [games](../Definitions.md#game) I want to see, so that _____.

---

2: As a [Spectator](./Actors.md#spectator), I want to be able to view previous [games](../Definitions.md#game), so that _____.

As a [Spectator](./Actors.md#spectator), I want to be able to view previous [games](../Definitions.md#game), so that _____.

---

3: As a [Spectator](./Actors.md#spectator), I want a livestream, so that _____.

As a [Spectator](./Actors.md#spectator), I want a livestream, so that _____.

---

```

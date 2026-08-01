# Ideas To Refer To In the Future

## Revised Submission & Tournament Execution Pipeline Proposal

### Proposed Procedure

#### Competitor Process/Logic

1. Competitor submits their latest code as their "current submission".
2. The "current submission" is added to a "submission queue".

#### Tournament Runner Process/Logic

1. Waits until a submission is in queue, then runs a tournament against the active submission (if it exists).
2. Then, runs the same tournament submission set/entity against the current submission.
3. The best performing submission becomes the active submission.
   - Current submission is still retained for final tournament run.
   - Re-upload or make ui element to make current submission the active submission (could be a per-team toggle/prompt).
4. Once finished, it takes next queued submission, and repeats.

### Possible constraints

- Tournament runtime
  - May be addressable with improvements to engine implementation & server-side logic/processing
- Game runtime

### Important Notes

Matches will be memoized; 10 possible seeds presented as an initial idea; matches refer to database cache before running to prevent reruns. The relationship from Matches : Tournaments -> Many to Many. We are not changing seeds before matches (the seed will be the same for all entities in the tournament). In a round, the only thing that will change are avatar/bot positions (might be positions in a list or physical positions).

---

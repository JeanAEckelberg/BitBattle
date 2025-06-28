```puml
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

title [Context Diagram] Bit Battle

System(bit_battle, "Bit Battle")

Person_Ext(comp_dev, "Competition Developer")
Person_Ext(comp_artist, "Competition Artist")
Person_Ext(comp_dba, "Competition Database Admin")
Person_Ext(comp_playtester, "Competition Playtester")
Person_Ext(competitor, "Competitor")
Person_Ext(spectator, "Spectator")
Person_Ext(comp_supporter, "Competition Supporter")

Rel(comp_dev, bit_battle, "Creates Competition Games")
Rel(comp_artist, bit_battle, "Uploads Sprites and Configures Animations")
Rel(comp_dba, bit_battle, "Adjusts Database for Competition and Maintains Database Integrity")
Rel(comp_playtester, bit_battle, "Playtests Competitions with 'Dev Permissions'")
Rel(competitor, bit_battle, "Uploads Bots, Gets Match Specific Debug Info, Checks Current Standing, Runs Test Matches")
Rel(spectator, bit_battle, "Watches Matches, Gets Competition Stats")
Rel(comp_supporter, bit_battle, "Check Telemetry and Fixes Issues to Ensure Competition Stability")
@enduml
```
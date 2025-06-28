```puml
@startuml

!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

!theme sandstone

title [Container Diagram] Bit Battle

Person_Ext(comp_dev, "Competition Developer")
Person_Ext(comp_artist, "Competition Artist")
Person_Ext(comp_dba, "Competition Database Admin")
Person_Ext(comp_playtester, "Competition Playtester")
Person_Ext(competitor, "Competitor")
Person_Ext(spectator, "Spectator")
Person_Ext(comp_supporter, "Competition Supporter")

System_Boundary(bit_battle, "Bit Battle") {
    Container(cli, "CLI", "Kotlin", "Competitor CLI for Registering and Submitting Bots")
    Container(bit_battle_ui, "Bit Battle UI", "Angular", "Web UI for Interacting with the Competition")
    ContainerDb(database, "Database", "PostgreSQL")
    Container(telemetry_stack, "Telemetry Stack", "Grafana / Kibana")
    Container(submission_service, "Submission Service", "Kotlin", "Service for Managing Bot Submissions")
    Container(registration_service, "Registration Service", "Kotlin", "Service for Competitors to Register for a Competition")
    Container(visualization_service, "Visualization Service", "Kotlin", "Generates Frames of a Game for Later Viewing")
    Container(scheduling_service, "Scheduling Service", "Kotlin", "Schedules Events that Should Happen Periodically")
    Container(orchestration_service, "Orchestration Service", "Go", "Starts and Stops Match Clusters")
    Container(match_cluster, "Match Cluster", "Docker Containers", "Runs a Match")
    Container(tournament_service, "Tournament Service", "Kotlin", "Schedules Groups of Matches that Make Up Tournaments")
    Container(announcement_service, "Announcement Service", "Kotlin", "Sends Important Updates to Competitors")
    Container(testing_service, "Testing Service", "Kotlin", "Starts Test Matches and Provides Relevant Debug Info")
    Container(api_gateway, "API Gateway", "Kotlin - Spring Boot", "Centralizes and Aggregates Calls From the clients")
}

Rel(comp_dba, telemetry_stack, "Checks Database Health")
Rel(comp_dba, database, "Manages the Database")

Rel(comp_artist, visualization_service, "Creates Animations and Frame Logic During Development")

Rel(comp_dev, telemetry_stack, "Checks For Errors During Game Development")
Rel(comp_dev, match_cluster, "Create game logic During Game Development")

Rel(comp_playtester, telemetry_stack, "Checks For Errors During Game Beta Phase")
Rel(comp_playtester, bit_battle_ui, "During Game Beta Phase: Registers, Submits Bots, Tests Bots, Checks Dots, etc.")
Rel(comp_playtester, cli, "During Game Beta Phase: Registers for Competition, Submits Bots")

Rel(comp_supporter, telemetry_stack, "Checks Competition Health")

Rel(competitor, bit_battle_ui, "Registers for Competition, Submits Bots, Tests Bots, Checks Dots, etc.")
Rel(competitor, cli, "Registers for Competition, Submits Bots")

Rel(spectator, bit_battle_ui, "Watches Matches")


Rel(cli, api_gateway, "Registers for Competition, Submits Bots, Get Competition Stats")
Rel(bit_battle_ui, api_gateway, "Registers for Competition, Submits Bots, Tests Bots, Checks Dots, etc.")

Rel(api_gateway, registration_service, "Registers a Competitor")
Rel(api_gateway, submission_service, "Uploads a Competitor Bot")
Rel(api_gateway, testing_service, "Starts a Test Match")
Rel(api_gateway, announcement_service, "Admin Sends Competition Announcement")
Rel(api_gateway, announcement_service, "Gets Competition Announcements")
Rel(api_gateway, visualization_service, "Fetch Visuals for a Match")
Rel(api_gateway, tournament_service, "Fetch Tournament Results")

Rel(scheduling_service, announcement_service, "Sends Scheduled Announcement")
Rel(scheduling_service, visualization_service, "Starts Scheduled Visualization Processing")
Rel(scheduling_service, tournament_service, "Starts Scheduled Tournament Processing")

Rel(testing_service, orchestration_service, "Requests the Start of a Test Match")
Rel(tournament_service, orchestration_service, "Requests the Start of a Match")
Rel(orchestration_service, match_cluster, "Starts and Ends Match Clusters")

Rel(match_cluster, tournament_service, "Send Periodic State and Results for DB storage")

Rel(visualization_service, database, "Manages Visualization Frames")
Rel(testing_service, database, "Manage Test Runs for Users")
Rel(submission_service, database, "Manages Competitor Bot Submissions")
Rel(registration_service, database, "Manages Registered Competitors")

Rel(submission_service, telemetry_stack, "Logs Telemetry Data")
Rel(registration_service, telemetry_stack, "Logs Telemetry Data")
Rel(visualization_service, telemetry_stack, "Logs Telemetry Data")
Rel(scheduling_service, telemetry_stack, "Logs Telemetry Data")
Rel(orchestration_service, telemetry_stack, "Logs Telemetry Data")
Rel(tournament_service, telemetry_stack, "Logs Telemetry Data")
Rel(testing_service, telemetry_stack, "Logs Telemetry Data")
Rel(telemetry_stack, database, "Scrape Telemetry Data (SqlToProm)")

@enduml
```
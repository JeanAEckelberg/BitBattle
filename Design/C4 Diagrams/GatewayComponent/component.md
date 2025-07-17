```plantuml
@startuml gateway component diagram
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Component.puml
' uncomment the following line and comment the first to use locally
' !include C4_Component.puml

LAYOUT_WITH_LEGEND()

title Component diagram for Internet Banking System - API Application

Container(cli, "CLI", "Kotlin", "Competitor CLI for Registering and Submitting Bots")
Container(bit_battle_ui, "Bit Battle UI", "Angular", "Web UI for Interacting with the Competition")
Container(telemetry_stack, "Telemetry Stack", "Grafana / Kibana")
Container(submission_service, "Submission Service", "Kotlin", "Service for Managing Bot Submissions")
Container(registration_service, "Registration Service", "Kotlin", "Service for Competitors to Register for a Competition")
Container(visualization_service, "Visualization Service", "Kotlin", "Generates Frames of a Game for Later Viewing")
Container(tournament_service, "Tournament Service", "Kotlin", "Schedules Groups of Matches that Make Up Tournaments")
Container(announcement_service, "Announcement Service", "Kotlin", "Sends Important Updates to Competitors")
Container(testing_service, "Testing Service", "Kotlin", "Starts Test Matches and Provides Relevant Debug Info")
Container(api_gateway, "API Gateway", "Kotlin - Spring Boot", "Centralizes and Aggregates Calls From the clients")

Container_Boundary(api_gateway, "API Gateway") {
    
}

Rel(cli, api_gateway, "Registers for Competition, Submits Bots, Get Competition Stats")
Rel(bit_battle_ui, api_gateway, "Registers for Competition, Submits Bots, Tests Bots, Checks Dots, etc.")

Rel(api_gateway, registration_service, "Registers a Competitor")
Rel(api_gateway, submission_service, "Uploads a Competitor Bot")
Rel(api_gateway, testing_service, "Starts a Test Match")
Rel(api_gateway, announcement_service, "Admin Sends Competition Announcement")
Rel(api_gateway, announcement_service, "Gets Competition Announcements")
Rel(api_gateway, visualization_service, "Fetch Visuals for a Match")
Rel(api_gateway, tournament_service, "Fetch Tournament Results")
@enduml
```
```plantuml
@startuml gateway component diagram
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Component.puml
' uncomment the following line and comment the first to use locally
' !include C4_Component.puml

LAYOUT_WITH_LEGEND()

title Gateway Component Diagram

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
    Component(aggregator, "Aggregator", "Class", "Used by routes to transform data for the frontend and backend's needs")
    Component(submission_route_locator, "Submission Route Locator", "Bean", "Hosts the routing for 'submission' APIs")
    Component(testing_route_locator, "Testing Route Locator", "Bean", "Hosts the routing for 'testing' APIs")
    Component(visualization_route_locator, "Visualization Route Locator", "Bean", "Hosts the routing for 'visualization' APIs")
    Component(users_route_locator, "Users Route Locator", "Bean", "Hosts the routing for 'users' APIs")
    Component(announcements_route_locator, "Announcements Route Locator", "Bean", "Hosts the routing for 'announcements' APIs")
    Component(tournament_route_locator, "Tournament Route Locator", "Bean", "Hosts the routing for 'tournament' APIs")
    Component(telemetry_route_locator, "Telemetry Route Locator", "Bean", "Hosts the routing for 'telemetry' APIs")
}

Rel(cli, api_gateway, "Registers for Competition, Submits Bots, Get Competition Stats")
Rel(bit_battle_ui, api_gateway, "Registers for Competition, Submits Bots, Tests Bots, Checks Dots, etc.")

Rel(telemetry_route_locator, telemetry_stack, "Gathers debug information")
Rel(users_route_locator, registration_service, "Registers a Competitor")
Rel(submission_route_locator, submission_service, "Uploads a Competitor Bot")
Rel(testing_route_locator, testing_service, "Starts a Test Match")
Rel(announcements_route_locator, announcement_service, "Admin Sends Competition Announcement")
Rel(announcements_route_locator, announcement_service, "Gets Competition Announcements")
Rel(visualization_route_locator, visualization_service, "Fetch Visuals for a Match")
Rel(tournament_route_locator, tournament_service, "Fetch Tournament Results")
@enduml
```

```puml
@startuml

!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Component.puml

LAYOUT_WITH_LEGEND()

title Component Diagram for BitBattle - Orchestration Service

Container(match_cluster, "Match Cluster", "Docker Containers", "Runs a Match")
Container(tournament_service, "Tournament Service", "Kotlin", "Schedules Groups of Matches that Make Up Tournaments")
Container(telemetry_stack, "Telemetry Stack", "Grafana / Kibana")
Container(testing_service, "Testing Service", "Kotlin", "Starts Test Matches and Provides Relevant Debug Info")

Container_Boundary(orchestration_service, "Orchestration Service") {
    Component(con_con, "Container Controller", "Gin Controller", "")
    Component(rabbit_mq, "RabbitMQ Client", "GoLobby Singleton / amqp091-go", "")
    Component(con_service, "Container Management Service", "GoLobby Transient", "Uses Strategy Pattern on the different clients to spin them up correctly")
    Component(con_repository, "Container Repository", "GoLobby Transient", "")
    Component(docker_client, "Docker Client", "GoLobby Factory Singleton", "")

    Rel(con_con, con_service, "")
    Rel(rabbit_mq, con_service, "")
    Rel(con_service, con_repository, "")
    Rel(con_repository, docker_client, "")
}


Rel(tournament_service, orchestration_service, "Requests the Start of a Match")
Rel(testing_service, orchestration_service, "Requests the Start of a Test Match")

Rel(docker_client, match_cluster, "Starts and Ends Match Clusters")
Rel(orchestration_service, telemetry_stack, "Logs Telemetry Data")

@enduml
```
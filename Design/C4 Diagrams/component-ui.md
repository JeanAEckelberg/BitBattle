```
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Component.puml

title [Component Diagram] Bit Battle UI

Person_Ext(spectator, "Spectator")
Person_Ext(competitor, "Competitor")

Container_Ext(user_service_ext, "User Service")
Container_Ext(submission_service_ext, "Submission Service")
Container_Ext(visualization_service_ext, "Visualization Service")
Container_Ext(testing_service_ext, "Testing Service")
System_Ext(docs_site_ext, "Docs Site")

Container_Boundary(bit_battle_ui, "Bit Battle UI") {
    Component(docs_component, "Docs Component", "HTML, SCSS, TypeScript")
    Component(visualization_component, "Visualization Component", "HTML, SCSS, TypeScript")
    Component(testing_component, "Testing Component", "HTML, SCSS, TypeScript")
    Component(submission_component, "Submission Component", "HTML, SCSS, TypeScript")
    Component(registration_component, "Registration Component", "HTML, SCSS, TypeScript")
    Component(login_component, "Login Component", "HTML, SCSS, TypeScript")
    Component(user_service, "User Service", "TypeScript")
    Component(auth_guard, "Auth Guard", "TypeScript")
    Component(submission_service, "Submission Service", "TypeScript")
    Component(match_service, "Match Service", "TypeScript")
}

Rel(spectator, visualization_component, "Watches Matches")
Rel(competitor, docs_component, "Reads Documentation")
Rel(competitor, submission_component, "Submits Bots")
Rel(competitor, visualization_component, "Watches Matches")
Rel(competitor, testing_component, "Requests Test Matches")
Rel(competitor, registration_component, "Registers For Competition")
Rel(competitor, login_component, "Logs in to Competition")
Rel(registration_component, user_service, "Submits Registration Forms")
Rel(user_service, user_service_ext, "Registers Competitor for Competition", "POST")
Rel(login_component, user_service, "Checks Credentials")
Rel(user_service, user_service_ext, "Checks Login Credentials", "POST")
Rel(testing_component, auth_guard, "Blocks Unauthorized Users")
Rel(submission_component, auth_guard, "Blocks Unauthorized Users")
Rel(submission_component, submission_service, "Submits Bots")
Rel(submission_service, submission_service_ext, "Submits Bots", "POST")
Rel(visualization_component, match_service, "Gets Visualization")
Rel(match_service, visualization_service_ext, "Gets Visualization", "GET")
Rel(testing_component, match_service, "Requests Test Match")
Rel(match_service, testing_service_ext, "Requests Test Match", "POST")
Rel(docs_component, docs_site_ext, "Embeds Content")
@enduml
```
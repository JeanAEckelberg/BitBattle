<!-- omit in toc -->
# Non-Functional Requirements

- [RFC 2119](#rfc-2119)
- [Progress Tracking Markers](#progress-tracking-markers)
- [Grounding](#grounding)
  - [Definition](#definition)
  - [Best Practices to Document Non-Functional Requirements](#best-practices-to-document-non-functional-requirements)
  - [The Software "-ilities"](#the-software--ilities)
- [0000: Functional Suitability](#0000-functional-suitability)
  - [0020:  Predefined Engine](#0020--predefined-engine)
- [1000: Performance Efficiency](#1000-performance-efficiency)
  - [% 1100: Time Behaviour](#-1100-time-behaviour)
    - [1110: Tournament Execution Speed](#1110-tournament-execution-speed)
  - [% 1200: Resource Utilization](#-1200-resource-utilization)
  - [% 1300: Capacity](#-1300-capacity)
    - [1310: Number of Teams in a Competition](#1310-number-of-teams-in-a-competition)
- [2000: Compatibility](#2000-compatibility)
  - [% 2100: Co-existence](#-2100-co-existence)
  - [% 2200: Interoperability](#-2200-interoperability)
  - [2210: Engine Implementation](#2210-engine-implementation)
- [3000: Usability](#3000-usability)
  - [% 3100: Recognizability](#-3100-recognizability)
  - [% 3200: Learnability](#-3200-learnability)
    - [3210: Contribution and Development Guide](#3210-contribution-and-development-guide)
    - [3220: Competition Setup/Development](#3220-competition-setupdevelopment)
    - [3230: Competition Administration](#3230-competition-administration)
  - [% 3300: Operability](#-3300-operability)
    - [3310: Competitor Submission](#3310-competitor-submission)
  - [% 3400: User Error Protection](#-3400-user-error-protection)
    - [3410: Administration Safety](#3410-administration-safety)
  - [% 3500: UI Aesthetics](#-3500-ui-aesthetics)
  - [% 3600: Accessibility](#-3600-accessibility)
- [4000: Reliability](#4000-reliability)
  - [% 4100: Maturity](#-4100-maturity)
  - [% 4200: Availability](#-4200-availability)
  - [4210: System Runtime](#4210-system-runtime)
  - [% 4300: Fault Tolerance](#-4300-fault-tolerance)
    - [4310: Exception Handling](#4310-exception-handling)
  - [% 4400: Recoverability](#-4400-recoverability)
    - [! 4410: Retry Policies](#-4410-retry-policies)
    - [4420: Restarting](#4420-restarting)
- [5000: Security](#5000-security)
  - [5020: Database Safety](#5020-database-safety)
  - [% 5100: Confidentiality](#-5100-confidentiality)
    - [% 5110: Database Access](#-5110-database-access)
  - [% 5200: Integrity](#-5200-integrity)
  - [% 5300: Non-repudiation](#-5300-non-repudiation)
    - [5310: Logs](#5310-logs)
      - [5311: Central Log Storage](#5311-central-log-storage)
      - [5312: Exceptions](#5312-exceptions)
      - [5313: Context](#5313-context)
      - [5314: Format](#5314-format)
      - [5315: Functions](#5315-functions)
      - [5316: Levels](#5316-levels)
      - [5317: Distribution](#5317-distribution)
    - [5320: Metrics](#5320-metrics)
      - [5321: Central Metrics Storage](#5321-central-metrics-storage)
    - [5330: Traces](#5330-traces)
      - [5331: Central Traces Storage](#5331-central-traces-storage)
    - [5340: Alerts](#5340-alerts)
      - [5341: Notifications](#5341-notifications)
  - [% 5400: Accountability](#-5400-accountability)
  - [% 5500: Authenticity](#-5500-authenticity)
- [6000: Maintainability](#6000-maintainability)
  - [6100: Build Maintainability](#6100-build-maintainability)
  - [% 6200: Testability](#-6200-testability)
    - [6210: Test Execution](#6210-test-execution)
    - [6220: Automated Test Execution](#6220-automated-test-execution)
    - [6230: Applying Code Changes](#6230-applying-code-changes)
    - [6240: Local Validation](#6240-local-validation)
    - [6241: Select Local Validation](#6241-select-local-validation)
  - [% 6300: Modularity](#-6300-modularity)
  - [% 6400: Reusability](#-6400-reusability)
  - [% 6500: Analysability](#-6500-analysability)
  - [% 6600: Modifiability](#-6600-modifiability)
- [7000: Portability](#7000-portability)
  - [% 7100: Adaptability](#-7100-adaptability)
    - [7110: Operating Systems](#7110-operating-systems)
    - [7120: Host Machine Migration](#7120-host-machine-migration)
    - [7130: Flexibility](#7130-flexibility)
  - [% 7200: Installability](#-7200-installability)
    - [7210: Installer](#7210-installer)
    - [7220: Uninstaller](#7220-uninstaller)
    - [% 7230: Skill](#-7230-skill)
    - [7240: Local Environment](#7240-local-environment)
  - [% 7300: Replaceability](#-7300-replaceability)

---

## RFC 2119

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

---

## Progress Tracking Markers

| Symbol | Location               | Meaning                    |
| ------ | ---------------------- | -------------------------- |
| `!`    | Start of a requirement | Ready for team review      |
| `%`    | Start of a requirement | Implementation in progress |

---

## Grounding

### Definition

Broadly, functional requirements define what a system is supposed to do and non-functional requirements define how a system is supposed to be. Functional requirements are usually in the form of "system shall do requirement", an individual action or part of the system, perhaps explicitly in the sense of a mathematical function, a black box description input, output, process and control functional model or IPO model. In contrast, non-functional requirements are in the form of "system shall be requirement", an overall property of the system as a whole or of a particular aspect and not a specific function. The system's overall properties commonly mark the difference between whether the development project has succeeded or failed.

Non-functional requirements are often called the "quality attributes" of a system. The emergent properties of a system are classified as non-functional requirements. Other terms for non-functional requirements are "qualities", "quality goals", "quality of service requirements", "constraints", "non-behavioral requirements", or "technical requirements". Informally these are sometimes called the "ilities", from attributes like stability and portability. Qualities that is non-functional requirements can be divided into two main categories:

- Execution qualities, such as safety, security and usability, which are observable during operation (at run time).
- Evolution qualities, such as testability, maintainability, extensibility and scalability, which are embodied in the static structure of the system.

As non-functional requirements are all requirements that do not fall into the functional requirements category, they also include both characteristics of the functions and constraints on the system such as non-design items of statutory, regulatory, standards and protocols, or other external requirements.

It is important to specify non-functional requirements in a specific and measurable way.

Excerpt pulled from <https://en.wikipedia.org/wiki/Non-functional_requirement>

### Best Practices to Document Non-Functional Requirements

Here are some best practices that can be followed for documenting non-functional requirements:

- Be Clear: Define non-functional requirements in clear, precise, and quantifiable terms.
- Avoid Ambiguous Terminology: Avoid ambiguity by using clear and consistent terminology while documenting non-functional requirements.
- Align with Business Goals: Ensure that non-functional requirements are aligned with the overall business objectives and user expectations.
- Prioritize Requirements: Prioritize and rank requirements based on what impact they will have on the system.
- Collaborate with Stakeholders: Collaborate with stakeholders including developers, end users, and business analysts, to gather a detailed and comprehensive set of requirements.

Excerpt pulled from <https://www.geeksforgeeks.org/software-engineering/non-functional-requirements-in-software-engineering/#best-practices-to-document-nonfunctional-requirements>

### The Software "-ilities"

Starting at the macro level, these "-ilities" define the abstract concepts that need to be considered when designing any piece of software. I am going to go over the core eight defined in ISO/IEC 25010, for a deeper dive see the links at the end of this section. (9 includes testing methods for each)

1. Functional Suitability
    > Does the software behave as needed? This is focused on the goal of the immediate need. Basically, if the software is meant to say "hello" 12 times, it should say it 12 times. Not 13, not throw an exception, not say "sup" 12 times.
2. Performance Efficiency
    > How performant is the software? Does it have `sleep(500)` after every line? Does it turn the machine it's running on into a heater?
3. Compatibility
    > Can the software be used with other software? Does it have a clear way to work with hardware if needed? Software should be designed so that more software can be made on top of it.
4. Usability
    > Is the software clear and easy to use? Can users learn the software quickly? Is the software protected from user stupidity? Is the software accessible to all?
5. Reliability
    > Is the software able to maintain the appropriate amount of uptime? Can it recover in the event of a fault? Can it retrieve data that may have been lost in the event of a fault?
6. Security
    > Is user information protected correctly? Does the software report all actions that are taken to audit in the event of an issue? Does the software report who or what process took what actions? Does the software appropriately ensure that the identity is verified?
7. Maintainability
    > Is the application testable? Are the components reusable? Are the components able to be changed with minimal impact on others? Is the impact of changes able to be quickly identified and tested without involving the whole? How easy is it to change the software?
8. Portability
    > Is this software able to be replaced with a comparable software relatively easily? Can it work across many different environments? How difficult is it to install or uninstall?

For More Information:

1. <https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=1353217>
2. <http://www.softwarearchitecturenotes.com/architecturerequirements.html>
3. <https://en.wikipedia.org/wiki/List_of_system_quality_attributes>
4. <https://nimblegravity.com/blog/ilities-in-software-engineering>
5. <https://codesqueeze.com/the-7-software-ilities-you-need-to-know/>
6. <https://en.wikipedia.org/wiki/ISO/IEC_9126>
7. <https://www.iso.org/obp/ui/en/#iso:std:iso-iec:25010:ed-2:v1:en>
8. <https://blog.codacy.com/iso-25010-software-quality-model>
9. <https://tuskr.app/learn/software-quality-dimensions>

---

## 0000: Functional Suitability
<!-- Functional Suitability pertains to the capability system or computer program to deliver functions that precisely address both explicit and implicit user requirements. -->
<!-- Probably should remove this as it is covered by the user stories -->

### 0020:  Predefined Engine

- Description: A predefined [engine](Definitions.md#engine) MUST exist for testing and so that [Competition Developers](Actors.md#Competition-Developer) do not have to build their own.
- Success Definition: Such an [engine](Definitions.md#engine) exists

---

## 1000: Performance Efficiency
<!-- Performance Efficiency involves the optimization of resource utilization concerning the performance output of a system or product. -->

### % 1100: Time Behaviour
<!-- focuses on the system's response, processing times, and throughput rates during operational phases. -->

#### 1110: Tournament Execution Speed

- Description: Due to our tournament structure, we MUST prioritize speed in order to allow teams to have their bots run against those of other teams.
- Success Definition: A tournament MUST complete within 10 minutes of the triggering submission

### % 1200: Resource Utilization
<!-- concerns the effective utilization of resources, such as CPU, memory, and network bandwidth, during system operation. -->

### % 1300: Capacity
<!-- evaluates the system's maximum limits concerning parameters and its ability to meet them adequately. -->

#### 1310: Number of Teams in a Competition

- Description: A competition MUST be able to be run with at least 100 teams.
- Success Definition: Performance requirements MUST be met with at least 100 teams in a competition.

---

## 2000: Compatibility
<!-- Compatibility assesses a product, system, or component's ability to exchange information and perform its functions seamlessly within a shared hardware or software environment. -->

### % 2100: Co-existence
<!-- evaluates a product's ability to operate efficiently alongside other products without adverse effects. -->

### % 2200: Interoperability
<!-- examines the seamless exchange of information and its utilization across multiple systems and software components. -->

### 2210: Engine Implementation

- Description: A team of [competition developers](Actors.md#competition-developer) MUST be able to build their own [engine](Definitions.md#engine) with any programming language they chose.
- Success Definition: The [system](Definitions.md#system) has a well-defined API. NOTE: WELL-DEFINED IS NOT CONCRETE ENOUGH TO EVALUATE

---

## 3000: Usability
<!-- Usability assesses the ease and effectiveness users can achieve predefined goals using a product or system. -->

### % 3100: Recognizability
<!-- examines the user's ability to discern the product's suitability for their requirements. -->

### % 3200: Learnability
<!-- evaluates the ease of learning to use the product or system effectively, particularly in emergencies. -->

#### 3210: Contribution and Development Guide

- Description: [System developers](Actors.md#system-developer) MUST be able to rely on project documentation for understanding and contributing to the project.
- Success Definition: There MUST exist up-to-date repository documentation that covers 100% of the procedures required to build, run, make changes to, and validate [system](./Definitions.md#system) components.

#### 3220: Competition Setup/Development

- Description: [Competition developers](Actors.md#Competition-Developer) with at least an upper level collegiate computing background MUST be able to set up and design a [competition](Definitions.md#competition).
- Success Definition: The [system](Definitions.md#system) MUST provide recommendations and documentation that guides [competition developers](Actors.md#Competition-Developer) through [competition](Definitions.md#competition) set up and implementation.

#### 3230: Competition Administration

- Description: [Competition hosts](Actors.md#Competition-Host) with at least an upper level collegiate computing background MUST be able to administer a [competition](Definitions.md#competition).
- Success Definition: The [system](Definitions.dm#system) MUST provide documentation that guides [competition hosts](Actors.md#Competition-Host) through [competition](Definitions.md#competition) administration tools and their uses.

### % 3300: Operability
<!-- measures the ease of operation and control of the product or system. -->

#### 3310: Competitor Submission

- Description: [Competitors](Actors.md#competitor) with no prior knowledge of the [system](Definitions.md#system) MUST be able to implement and submit a [bot](Definitions.md#bot) to the [competition](Definitions.md#competition) before it ends.
- Success Definition: The [system](Definitions.md#system) MUST provide documentation that guides [competitors](Actors.md#competitors) through the process of implementing and submitting a [bot](Definitions.md#bot).

### % 3400: User Error Protection
<!-- gauges the system's safeguards against user errors to minimize their occurrence and impact. -->

#### 3410: Administration Safety

- Definition: Administration actions that are difficult to reverse MUST provide a safety feature.
- Success Definition: Administration actions with serious consequences MUST ask for confirmation with an in-depth review of the action.

### % 3500: UI Aesthetics
<!-- evaluates the aesthetic appeal of the user interface and its impact on user engagement. -->

### % 3600: Accessibility
<!-- evaluates the product's usability across various user characteristics and capabilities. -->

---

## 4000: Reliability
<!-- Reliability focuses on the dependability of a system, product, or component in executing predefined functions under stipulated conditions. -->

### % 4100: Maturity
<!-- evaluates the readiness of a system, product, or component to meet reliability needs satisfactorily. -->

### % 4200: Availability
<!-- assesses the operational state and accessibility of a system, product, or component. -->

### 4210: System Runtime

- Description: The system MUST remain stable within expected competition durations.
- Success Definition: The system MUST be able to run continually without notable degradation for 72 hours.

### % 4300: Fault Tolerance
<!-- gauges the system's operational continuity despite potential hardware or software faults. -->

#### 4310: Exception Handling

- Description: Exceptions SHOULD be handled safely and gracefully.
- Success Definition: Exceptions SHOULD NOT exhibit undefined behavior or crash the program without need.

### % 4400: Recoverability
<!-- evaluates the system's capability to retrieve data following interruptions or failures. -->

#### ! 4410: Retry Policies

- Description: Operations should be idempotent and have retry policies in the event of a potential transient error.
- Success Definition: Potential areas for retry policies MUST be reviewed and evaluated during merge requests.

#### 4420: Restarting

- Description: The competition MUST be able to be restarted from a recent state
- Success Definition: In the event of a failure the system MUST be able to be restarted while maintaining the history of matches which have already fully executed

---

## 5000: Security
<!-- Security refers to protecting information and data from potential security vulnerabilities. -->

### 5020: Database Safety

- dont get SQL injected. Wash yo ahh

### % 5100: Confidentiality
<!-- focuses on ensuring that data remains accessible only to authorized individuals. -->

#### % 5110: Database Access

- Description: Individuals who are **not** a [competition DBA](Actors.md#competition-dba-database-administrator) MUST NOT be able to access the [competition's](Definitions.md#competition) database.
- Success Definition: Permissions are audited to ensure limited access

### % 5200: Integrity
<!-- evaluates the system's capability to prevent unauthorized access or modification to data and programs. -->

### % 5300: Non-repudiation
<!-- ensures that actions or events can be irrefutably proven to have occurred. -->

#### 5310: Logs

##### 5311: Central Log Storage

- Description: A central, queryable, log system MUST exist.
- Success Definition: Such a system is included.

##### 5312: Exceptions

- Description: All methods MUST log failures and exceptions to a common location.
- Success Definition: Code audit validates that this is true.

##### 5313: Context

- Description: Logs SHOULD carry application context such as endpoint, user, class, and method.
- Success Definition: Code audit validates that this is true.

##### 5314: Format

- Description: Logs MUST use structured logging with lower case field names for indexing.
- Success Definition: Code audit validates that this is true.

##### 5315: Functions

- Description: All methods SHOULD log parameters and response at a trace level or above.
- Success Definition: Code audit validates that this is true.

##### 5316: Levels

- Description: Log levels SHOULD be used in accordance with this document: <https://betterstack.com/community/guides/logging/log-levels-explained/>.
- Success Definition: Log levels MUST be reviewed and evaluated during merge requests.

##### 5317: Distribution

- Description: All logs SHOULD be sent to a centralized log storage system. Exclusion of any logs MUST be documented.
- Success Definition: Logs from every service are seen in the centralized log storage system.

#### 5320: Metrics

##### 5321: Central Metrics Storage

- Description: A central, queryable, metrics system MUST exist.
- Success Definition: Such a system is included.

#### 5330: Traces

##### 5331: Central Traces Storage

- Description: A central, queryable, traces system MUST exist.
- Success Definition: Such a system is included.

#### 5340: Alerts

##### 5341: Notifications

- Description: Exceptions MUST notify administrators
- Success Definition: Administrators are notified when an exception occurs

### % 5400: Accountability
<!-- refers to the traceability of unauthorized actions back to their originator. -->

### % 5500: Authenticity
<!-- concerns the verification of a subject or resource's identity. -->

---

## 6000: Maintainability
<!-- Maintainability evaluates a product or system's ease of modification to enhance, correct, or adapt to environmental or requirement changes. -->

### 6100: Build Maintainability

### % 6200: Testability
<!-- concerns the effectiveness of establishing test criteria and conducting tests to ascertain compliance. -->

#### 6210: Test Execution

- Description: [System developers](Actors.md#system-developer) MUST be able to execute a test build using a single documented script or container.
- Success Definition: A single documented script or container exists which satisfies the above condition.

#### 6220: Automated Test Execution

- Description: The test suite SHOULD be executed by an automated process (e.g. a Forgejo/GitHub Action triggered on pull request).
- Success Definition: Repositories are audited for automated testability on a regular basis and exemptions are documented with justification.

#### 6230: Applying Code Changes

- Description: [System developers](Actors.md#system-developer) MUST be able to apply and test code changes locally.
- Success Definition: [System](Definitions.md#system) components MUST be able to be built, run, tested, and validated without manual file manipulation.

#### 6240: Local Validation

- Description: [System developers](Actors.md#system-developer) MUST be able to run the complete suite of local validation checks (such as tests and linting).
- Success Definition: A single documented command or script exists which satisfies the above condition.

#### 6241: Select Local Validation

- Description: [System developers](Actors.md#system-developer) MUST be able to run select local validation checks (such as tests and linting).
- Success Definition: A single documented command or script exists which satisfies the above condition.

### % 6300: Modularity
<!-- assesses the extent to which system components can be altered with minimal impact on others. -->

### % 6400: Reusability
<!-- concerns the potential for assets to be utilized across multiple systems. -->

### % 6500: Analysability
<!-- evaluates the effectiveness of impact assessments on planned changes and the system's diagnosability for deficiencies. -->

### % 6600: Modifiability
<!-- examines the ease of system modification without compromising quality. -->

---

## 7000: Portability
<!-- Portability evaluates a system, product, or component's ease of transfer between different environments. -->

### % 7100: Adaptability
<!-- examines the system's ability to adapt to diverse or evolving hardware, software, and usage environments. -->

#### 7110: Operating Systems

- Description: The system SHOULD work on all major operating systems (Windows, Linux, TempleOS, macOS...)
- Success Definition: The [system](Definitions.md#system) works on all major operating systems.

#### 7120: Host Machine Migration

- Description: Instances where a [competition](Definitions.md#competition) needs to be moved to another host machine SHOULD be accounted for.
- Success Definition: Given relevant data files a [competition](Definitions.md#competition) SHOULD be able to be stopped, migrated, and restarted on a different host machine.

#### 7130: Flexibility

- Description: The [system](Definitions.md#system) SHOULD be provided as raw files
- Success Definition: The [system](Definitions.md#system) is accessible as raw files

### % 7200: Installability
<!-- evaluates the system's success in installation and uninstallation processes. -->

#### 7210: Installer

- Description: The [system](Definitions.md#system) SHOULD have an installer
- Success Definition: The download comes with an executable installer

#### 7220: Uninstaller

- Description: The [system](Definitions.md#system) MUST have an uninstaller
- Success Definition: The install comes with an executable uninstaller to clean up everything

#### % 7230: Skill

- Description: The [system](Definitions.md#system) SHOULD be installable by someone with at least an upper level collegiate computing background given install documentation
- Success Definition: idk go test it. find a college student and force them to install software from the internet NOTE: INSUFFICIENT

#### 7240: Local Environment

- Description: [System developers](Actors.md#system-developer) MUST be able to set up a fully working local environment.
- Success Definition: A single documented script or procedure exists which satisfies the above condition.

### % 7300: Replaceability
<!-- gauges a product's potential to substitute another comparable product effectively. -->

---

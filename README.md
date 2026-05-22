# toDō 

![iOS](https://img.shields.io/badge/iOS-26%2B-black?logo=apple)
![Swift](https://img.shields.io/badge/Swift-Latest-F05138?logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/Framework-SwiftUI-blue)
![SwiftData](https://img.shields.io/badge/Persistence-SwiftData-darkblue)
![Architecture](https://img.shields.io/badge/Architecture-Model_View-brightgreen)

**toDō** is a focused, insight-driven task system built natively for Apple platforms. It goes beyond simple lists, emphasizing clarity, structure, and execution through a full lifecycle approach to task management, including advanced tagging, granular recurrence, sub-tasking, and deep performance tracking.

> **Status: TestFlight *Beta***
> 
> toDō is currently undergoing active beta testing via TestFlight. We are continuing sync and reliability improvements, refining the UX, and resolving final issues ahead of release. A public App Store release is planned following the completion of beta testing.

## Design Principles

toDō is built around the idea that task management should reduce mental friction, not create more of it. The app prioritizes clarity, deliberate structure, and lifecycle awareness over cluttered productivity mechanics. Every feature is designed to feel native, immediate, and intentional across Apple platforms.

## Core Features

### Intelligent Task Management
* **Full Task Lifecycle:** Seamlessly move tasks through Active, Done, Archived, and Trashed states.
* **NanoDos (Subtasks):** Break complex toDōs down into actionable, trackable steps using NanoDos.
* **Tagging & Organization:** A robust tagging system designed for fast filtering, organization, and reduced task friction. Supports bulk actions for quick cleanup and organization.

### Advanced Reminders & Scheduling
* **Reminder Intents:** Define how tasks interrupt you. Choose from *Quiet* (Notification Center only), *Due* (Standard alert), or *Time-Sensitive* (Breaks through Focus modes).
* **Location-Based Reminders:** Trigger alerts when arriving at or leaving specific locations, complete with adjustable geofence radiuses.
* **Granular Recurrence:** Set continuous or finite recurring tasks across flexible units ranging from seconds to years.

### Stats & Actionable Insights
toDō doesn't just track what you do; it helps you understand how you work. All data is processed privately on-device.
* **Focus Pressure Score:** A live read on your task pressure based on overdue, due today, and time-sensitive items.
* **Momentum & Planning Accuracy:** Track completion rates, on-time delivery, and completion streaks.
* **Private Insights:** Automatically identifies stale tasks (idle for 14+ days) and highlights productive tagging patterns.

### Deep Ecosystem Integration
* **Live Activities:** Keep a constant eye on Time-Sensitive tasks directly from the Lock Screen and Dynamic Island.
* **Interactive Widgets:** A complete suite of Lock Screen (Accessory) and Home Screen (Small, Medium, Large) widgets.
* **Apple Watch App:** Manage your day directly from your wrist with a standalone companion experience.
* **Calendar Mirroring:** Optionally sync scheduled toDōs directly to Apple Calendar.

### Sync Your Way
Choose the privacy and sync model that fits your workflow:
1. **Device Only:** Highest privacy. Your data never leaves your iPhone.
2. **iCloud Sync:** Best for users deeply integrated into the Apple ecosystem using private CloudKit storage.
3. **toDō Sync (Everywhere):** Powered by Supabase, enabling future cross-platform access across web and Android under a dedicated toDō account.

## Technical Foundation

Built for the modern Apple ecosystem, toDō leverages the latest Apple platform frameworks to deliver a highly performant, state-driven experience.

* **Architecture:** Streamlined **Model-View** architecture that embraces SwiftUI’s declarative state management natively.
* **UI Framework:** Native SwiftUI across iPhone, iPad, Apple Watch, widgets, and Live Activities.
* **Local Persistence:** SwiftData
* **Cloud Infrastructure:** CloudKit (Apple) & Supabase (PostgreSQL)
* **Highlights:** Componentized feature modules, custom theme infrastructure (`AppTheme`), structured sync coordination (`SyncCoordinator`), and efficient bulk-action handling.

## Getting Involved

toDō is currently in active TestFlight Beta as we continue refining the experience ahead of public release.

**Interested in joining the beta?**  

New testers are welcome. Reach out to <hello@iamshift.dev> for an invite.

**For Current Testers:**  

1. Please submit feedback directly through the TestFlight app.
2. Focus on crash reports, sync reliability, notification behavior, and UI/UX friction points.
3. Include screenshots or screen recordings whenever possible to help isolate issues faster.

Stay tuned for the official App Store launch.


```
Built for the Apple ecosystem by moin.shift().

Intention → Build → shift •
```

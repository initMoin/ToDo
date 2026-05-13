//
//  NotificationContentBuilder.swift
//  ToDo
//
//  Created by Moinuddin Ahmad on 5/10/26.
//

import Foundation
import UserNotifications

enum NotificationDebugScenario: String, CaseIterable, Identifiable, Sendable {
   case dueSoon
   case overdue
   case recurring
   case quiet
   case timeSensitive
   case syncRefresh

   var id: String { rawValue }

   var title: String {
      switch self {
      case .dueSoon:
         return "Due Reminder"
      case .overdue:
         return "Overdue"
      case .recurring:
         return "Recurring"
      case .quiet:
         return "Quiet"
      case .timeSensitive:
         return "Time-Sensitive"
      case .syncRefresh:
         return "Sync Refresh"
      }
   }

   var body: String {
      switch self {
      case .dueSoon:
         return "Tests the normal due-reminder notification path."
      case .overdue:
         return "Tests urgent overdue reminder copy and metadata."
      case .recurring:
         return "Tests recurring reminder copy and metadata."
      case .quiet:
         return "Tests a passive notification that should avoid sound."
      case .timeSensitive:
         return "Tests a Time Sensitive reminder."
      case .syncRefresh:
         return "Tests the silent sync-refresh payload shape."
      }
   }

   var notificationType: RemoteNotificationType {
      switch self {
      case .dueSoon, .timeSensitive:
         return .toDoDue
      case .overdue:
         return .toDoOverdue
      case .recurring:
         return .recurringToDo
      case .quiet:
         return .reminder
      case .syncRefresh:
         return .syncCompleted
      }
   }

   var isRecurring: Bool {
      self == .recurring
   }

   var isTimeSensitive: Bool {
      self == .timeSensitive || self == .overdue
   }
}

struct NotificationContentBuilder {

   static func content(
      for type: RemoteNotificationType,
      title: String,
      body: String,
      isTimeSensitive: Bool = false,
      isQuiet: Bool = false
   ) -> UNMutableNotificationContent {

      let content = UNMutableNotificationContent()

      content.title = title
      content.body = body
<<<<<<< Updated upstream
=======
      content.sound = isQuiet ? nil : .default
>>>>>>> Stashed changes

      switch type {

      case .toDoDue:
<<<<<<< Updated upstream
         content.categoryIdentifier =
         NotificationCategoryID.taskReminder.rawValue

         content.sound = .default

         content.interruptionLevel = .timeSensitive

         content.threadIdentifier = "todo-reminders"

         content.targetContentIdentifier = "todo-due"

         content.relevanceScore = 0.9

      case .toDoOverdue:
         content.categoryIdentifier =
         NotificationCategoryID.taskReminder.rawValue

         content.sound = .default

         content.interruptionLevel = .timeSensitive

         content.threadIdentifier = "todo-reminders"

         content.targetContentIdentifier = "todo-overdue"

         content.relevanceScore = 0.9

      case .recurringToDo:
         content.categoryIdentifier =
         NotificationCategoryID.recurringReminder.rawValue

         content.sound = .default

         content.threadIdentifier = "todo-recurring"

         content.targetContentIdentifier = "todo-recurring"

         content.relevanceScore = 0.7

      case .circleInvite:
         content.categoryIdentifier =
         NotificationCategoryID.collaboration.rawValue

         content.sound = .default

         content.threadIdentifier = "circle-invites"

         content.targetContentIdentifier = "circle-invite"

         content.relevanceScore = 0.8

      case .circleUpdate:
         content.categoryIdentifier =
         NotificationCategoryID.collaboration.rawValue

         content.sound = .default

         content.threadIdentifier = "circle-updates"

=======
         content.categoryIdentifier = NotificationCategoryID.taskReminder.rawValue
         content.interruptionLevel = isTimeSensitive ? .timeSensitive : .active
         content.threadIdentifier = "todo-reminders"
         content.targetContentIdentifier = "todo-due"
         content.relevanceScore = isTimeSensitive ? 1.0 : 0.75

      case .toDoOverdue:
         content.categoryIdentifier = NotificationCategoryID.taskReminder.rawValue
         content.interruptionLevel = isTimeSensitive ? .timeSensitive : .active
         content.threadIdentifier = "todo-reminders"
         content.targetContentIdentifier = "todo-overdue"
         content.relevanceScore = 1.0

      case .recurringToDo:
         content.categoryIdentifier = NotificationCategoryID.recurringReminder.rawValue
         content.interruptionLevel = isTimeSensitive ? .timeSensitive : .active
         content.threadIdentifier = "todo-recurring"
         content.targetContentIdentifier = "todo-recurring"
         content.relevanceScore = isTimeSensitive ? 0.95 : 0.7

      case .circleInvite:
         content.categoryIdentifier = NotificationCategoryID.collaboration.rawValue
         content.threadIdentifier = "circle-invites"
         content.targetContentIdentifier = "circle-invite"
         content.relevanceScore = 0.8

      case .circleUpdate:
         content.categoryIdentifier = NotificationCategoryID.collaboration.rawValue
         content.threadIdentifier = "circle-updates"
>>>>>>> Stashed changes
         content.targetContentIdentifier = "circle-update"
         content.relevanceScore = 0.6

      case .syncConflict:
<<<<<<< Updated upstream
         content.categoryIdentifier =
         NotificationCategoryID.sync.rawValue

         content.sound = .default

         content.threadIdentifier = "sync-events"

=======
         content.categoryIdentifier = NotificationCategoryID.sync.rawValue
         content.threadIdentifier = "sync-events"
>>>>>>> Stashed changes
         content.targetContentIdentifier = "sync-conflict"
         content.relevanceScore = 0.85

      case .syncCompleted:
         content.categoryIdentifier = NotificationCategoryID.sync.rawValue
         content.sound = nil
<<<<<<< Updated upstream

         content.threadIdentifier = "sync-events"

         content.targetContentIdentifier = "sync-complete"

         content.relevanceScore = 0.3

      case .reminder:
         content.sound = .default

         content.threadIdentifier = "general-reminders"

=======
         content.interruptionLevel = .passive
         content.threadIdentifier = "sync-events"
         content.targetContentIdentifier = "sync-complete"
         content.relevanceScore = 0.3

      case .reminder:
         content.interruptionLevel = isQuiet ? .passive : .active
         content.threadIdentifier = "general-reminders"
>>>>>>> Stashed changes
         content.targetContentIdentifier = "general-reminder"
         content.relevanceScore = isQuiet ? 0.3 : 0.5

<<<<<<< Updated upstream
         content.relevanceScore = 0.5

      case .test:
         content.sound = .default

         content.threadIdentifier = "debug-notifications"

=======
      case .test:
         content.threadIdentifier = "debug-notifications"
>>>>>>> Stashed changes
         content.targetContentIdentifier = "debug-notification"
         content.relevanceScore = 0.1
      }

      return content
   }

   static func debugContent(
      for scenario: NotificationDebugScenario,
      toDoTitle: String = "Review ToDo",
      toDoIdentifier: String? = nil,
      toDoCloudIdentifier: UUID? = nil
   ) -> UNMutableNotificationContent {
      let title: String
      let body: String

      switch scenario {
      case .dueSoon:
<<<<<<< Updated upstream
         title = "ToDo: due"
         body = toDoTitle
      case .overdue:
         title = "ToDo: overdue"
         body = toDoTitle
      case .recurring:
         title = "ToDo: repeats"
         body = toDoTitle
	      case .quiet:
	         title = "ToDo"
	         body = toDoTitle
=======
         title = "ToDo due"
         body = toDoTitle
      case .overdue:
         title = "Overdue ToDo"
         body = toDoTitle
      case .recurring:
         title = "Repeating ToDo"
         body = toDoTitle
      case .quiet:
         title = "ToDo"
         body = toDoTitle
>>>>>>> Stashed changes
      case .timeSensitive:
         title = "Time Sensitive ToDo"
         body = toDoTitle
      case .syncRefresh:
         title = "ToDo Sync"
         body = "Changes are ready to refresh."
      }

<<<<<<< Updated upstream
      let content = content(for: scenario.notificationType, title: title, body: body)
=======
      let content = content(
         for: scenario.notificationType,
         title: title,
         body: body,
         isTimeSensitive: scenario.isTimeSensitive,
         isQuiet: scenario == .quiet
      )
>>>>>>> Stashed changes
      var userInfo: [String: Any] = [
         "schemaVersion": 1,
         "type": scenario.notificationType.rawValue,
         "isRecurring": scenario.isRecurring,
         "isTimeSensitive": scenario.isTimeSensitive,
         "debugScenario": scenario.rawValue
      ]

      if let toDoIdentifier {
         userInfo["todoIdentifier"] = toDoIdentifier
      }

      if let toDoCloudIdentifier {
         userInfo["todoCloudIdentifier"] = toDoCloudIdentifier.uuidString
      }

<<<<<<< Updated upstream
	      if scenario == .syncRefresh {
	         userInfo["todoSync"] = "refresh"
	      }

	      if scenario == .quiet {
	         content.sound = nil
	         content.interruptionLevel = .passive
	      }

	      content.userInfo = userInfo
=======
      if scenario == .syncRefresh {
         userInfo["todoSync"] = "refresh"
      }

      content.userInfo = userInfo
>>>>>>> Stashed changes

      return content
   }
}

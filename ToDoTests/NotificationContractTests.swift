import Foundation
import Testing
import UserNotifications
@testable import ToDo

@Suite("Notification contract")
@MainActor
struct NotificationContractTests {
    @Test func debugScenariosHaveUserFacingCopyAndPayloadTypes() {
        for scenario in NotificationDebugScenario.allCases {
            #expect(!scenario.title.isEmpty)
            #expect(!scenario.body.isEmpty)
            #expect(!scenario.notificationType.rawValue.isEmpty)
        }
    }

    @Test func dueDebugNotificationCarriesRoutableToDoPayload() throws {
        let toDoID = UUID()
        let content = NotificationContentBuilder.debugContent(
            for: .dueSoon,
            toDoTitle: "File quarterly report",
            toDoIdentifier: "local-id",
            toDoCloudIdentifier: toDoID
        )

        #expect(content.title == "ToDo: due")
        #expect(content.body == "File quarterly report")
        #expect(content.userInfo["type"] as? String == RemoteNotificationType.toDoDue.rawValue)
        #expect(content.userInfo["todoIdentifier"] as? String == "local-id")
        #expect(content.userInfo["todoCloudIdentifier"] as? String == toDoID.uuidString)
        #expect(content.userInfo["isRecurring"] as? Bool == false)
    }

    @Test func quietDebugNotificationStaysPassiveAndSilent() {
        let content = NotificationContentBuilder.debugContent(
            for: .quiet,
            toDoTitle: "Read brief"
        )

        #expect(content.userInfo["type"] as? String == RemoteNotificationType.reminder.rawValue)
        #expect(content.sound == nil)
        #expect(content.interruptionLevel == .passive)
        #expect(content.userInfo["isTimeSensitive"] as? Bool == false)
    }

    @Test func syncRefreshDebugNotificationDoesNotPretendToBeAToDoReminder() {
        let content = NotificationContentBuilder.debugContent(for: .syncRefresh)

        #expect(content.userInfo["type"] as? String == RemoteNotificationType.syncCompleted.rawValue)
        #expect(content.userInfo["todoIdentifier"] == nil)
        #expect(content.userInfo["todoSync"] as? String == "refresh")
        #expect(content.sound == nil)
    }

    @Test func notificationRouterRoutesToDoPayloadsIntoNavigationState() {
        let toDoID = UUID()
        NavigationCoordinator.shared.notificationRoute = .none

        NotificationRouter.shared.route(
            payload: NotificationPayload(
                type: .toDoDue,
                title: "ToDo: due",
                body: "Follow up",
                toDoID: toDoID
            )
        )

        #expect(NavigationCoordinator.shared.notificationRoute == .toDo(toDoID))
    }

    @Test func notificationRouterRoutesSyncPayloadsIntoReviewState() {
        NavigationCoordinator.shared.notificationRoute = .none

        NotificationRouter.shared.route(
            payload: NotificationPayload(
                type: .syncConflict,
                title: "Sync Needs Review",
                body: "Choose which version to keep."
            )
        )

        #expect(NavigationCoordinator.shared.notificationRoute == .sync)
    }
}

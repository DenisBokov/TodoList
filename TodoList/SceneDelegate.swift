//
//  SceneDelegate.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func assembly() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let viewController = storyboard.instantiateViewController(
            withIdentifier: "TodoListTableViewController"
        ) as! TodoListTableViewController // swiftlint:disable:this force_cast

        viewController.taskManager = buildTaskManager()

        return viewController
    }

    func buildTaskManager() -> TaskManagerProtocol {
        let taskManager = TaskManager()
        let tasks = [
            ImportantTask(titel: "Do homework", completed: Date(), taskPriorety: .high),
            RegularTask(title: "Do Workout", completed: true),
            ImportantTask(title: "Write new tasks", date: Date(), taskPriority: .low),
            RegularTask(title: "Solve 3 algorithms"),
            ImportantTask(title: "Go shopping", date: Date(), taskPriority: .medium)
        ]
        taskManager.addTasks(tasks: tasks)

        return taskManager
    }
}


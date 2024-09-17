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
        ) as! TodoListTableViewController

        viewController.taskManager = buildTaskManager()

        return viewController
    }

    func buildTaskManager() -> TaskManagerProtocol {
        let taskManager = TaskManager()
        let tasks = [
            ImportantTask(titel: "Сходить за хлебом", completed: false, taskPriorety: .low, date: Date()),
            ImportantTask(titel: "Убраться дома", completed: true, taskPriorety: .medium, date: Date()),
            ImportantTask(titel: "Сходить за хлебом", completed: false, taskPriorety: .high, date: Date()),
            RegularTask(titel: "Сходить за хлебом", completed: true)
        ]
        taskManager.addTasks(tasks: tasks)

        return taskManager
    }
}


//
//  SceneDelegate.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        window.rootViewController = UINavigationController(rootViewController: assembly())
        window.makeKeyAndVisible()
        
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}

    func assembly() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let viewController = storyboard.instantiateViewController(
            withIdentifier: "TodoListTableViewController"
        ) as! TodoListTableViewController

        viewController.taskManager = (buildTaskManager() as! TaskManager)

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


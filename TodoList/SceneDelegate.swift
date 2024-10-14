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

    func assembly() -> UIViewController {

        let viewController = TodoListTableViewController(taskManager: buildTaskManager())

        return viewController
    }

    func buildTaskManager() -> TaskManagerProtocol {
        let taskManager = OrderdTaskManager(taskManager: TaskManager())
        
        let tasks: [Task] = [
            .important(ImportantTask(titel: "Сходить за хлебом", taskPriorety: .high, dateCreationTask: Date(), taskStatus: .notStarted)),
            .important(ImportantTask(titel: "Убраться дома", taskPriorety: .medium, dateCreationTask: Date(), taskStatus: .notStarted)),
            .important(ImportantTask(titel: "SwiftUI", taskPriorety: .high, dateCreationTask: Date(), taskStatus: .notStarted)),
            .regular(RegularTask(titel: "Приготовить кофе", completed: true)),
            .important(ImportantTask(titel: "труктуры данных", taskPriorety: .low, dateCreationTask: Date(), taskStatus: .notStarted))
        ]
        
        taskManager.addTasks(tasks: tasks)

        return taskManager
    }
}


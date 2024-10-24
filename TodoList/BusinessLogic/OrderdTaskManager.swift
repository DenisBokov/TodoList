//
//  OrderdTaskManager.swift
//  TodoList
//
//  Created by Denis Bokov on 25.09.2024.
//

import Foundation


final class OrderdTaskManager: TaskManagerProtocol {
    
    private let taskManager: TaskManagerProtocol
    
    init(taskManager: any TaskManagerProtocol) {
        self.taskManager = taskManager
    }
    
    func getAllTasks() -> [Task] {
        taskManager.getAllTasks().sorted(by: <)
    }
    
    func completedTasks() -> [Task] {
        taskManager.completedTasks().sorted(by: <)
    }
    
    func uncompletedTasks() -> [Task] {
        taskManager.uncompletedTasks().sorted(by: <)
    }
    
    func addTasks(tasks: [Task]) {
        taskManager.addTasks(tasks: tasks)
    }
}

//private extension OrderdTaskManager {
//    func sorted(tasks: [Task]) -> [Task] { 
//        tasks.sorted {
//            if let task0 = $0 as? ImportantTask, let task1 = $1 as? ImportantTask {
//                return task0.taskPriorety.rawValue > task1.taskPriorety.rawValue
//            }
//            
//            if $0 is ImportantTask, $1 is RegularTask {
//                return true
//            }
//            
//            return false
//        }
//    }
//}

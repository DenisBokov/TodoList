//
//  TaskManager.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import Foundation

protocol TaskManagerProtocol {
    func allTasks() -> [Task]
    func completedTasks() -> [Task]
    func uncompletedTasks() -> [Task]
    func addTasks(tasks: [Task])
}

final class TaskManager {
    private var taskList: [Task] = []
    
    
    func completedTasks() -> [Task] {
        taskList.filter { $0.completed }
    }
    
    func uncompletedTasks() -> [Task] {
        taskList.filter { !$0.completed }
    }
    
    func getAllTasks() -> [Task] {
        taskList
    }
    
    func addTask(task: Task) {
        taskList.append(task)
    }
    
    func removeTask(task: Task) {
        
        /// Для удаления сравниванием объекты 
        taskList.removeAll { $0 === task }
    }
}

extension ImportantTask.TaskPriority: CustomStringConvertible {
    var description: String {
        switch self {
        case .high:
            return "!!!"
        case .medium:
            return "!!"
        case .low:
            return "!"
        }
    }
}

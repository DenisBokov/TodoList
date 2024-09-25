//
//  TaskManagerProtocol.swift
//  TodoList
//
//  Created by Denis Bokov on 17.09.2024.
//

import Foundation


protocol TaskManagerProtocol {
    func getAllTasks() -> [Task]
    func completedTasks() -> [Task]
    func uncompletedTasks() -> [Task]
    func addTasks(tasks: [Task])
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

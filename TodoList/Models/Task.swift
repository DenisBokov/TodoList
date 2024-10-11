//
//  Task.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import Foundation

enum Task {
    case regular(RegularTask)
    case important(ImportantTask)
}

struct RegularTask {
    let titel: String
    let completed: Bool
}

struct ImportantTask {
    let titel: String
    let completed: Bool
    
    let taskPriorety: TaskPriority
    let dateCreationTask: Date
    let taskStatus: TaskStatus
    
    var deadLine: Date {
        switch taskPriorety {
        case .low:
            Calendar.current.date(byAdding: .day, value: 3, to: dateCreationTask) ?? Date()
        case .medium:
            Calendar.current.date(byAdding: .day, value: 2, to: dateCreationTask) ?? Date()
        case .high:
            Calendar.current.date(byAdding: .day, value: 1, to: dateCreationTask) ?? Date()
        }
    }
    
    enum TaskPriority: Int {
        case low
        case medium
        case high
    }
    
    enum TaskStatus {
        case notStarted
        case complited
        case canceled
        case paused
    }
}


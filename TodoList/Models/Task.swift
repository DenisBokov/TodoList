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

extension Task {
    var completed: Bool {
        switch self {
        case .regular(let regularTask):
            return regularTask.completed
        case .important(let importantTask):
            return importantTask.completed
        }
    }
    
    var titel: String {
        switch self {
        case .regular(let regularTask):
            return regularTask.titel
        case .important(let importantTask):
            return importantTask.titel
        }
    }
}

extension ImportantTask {
    var completed: Bool {
        taskStatus == .complited
    }
}

//extension Task: Equatable {
//    static func == (lhs: Task, rhs: Task) -> Bool {
//        return lhs == rhs
//    }
//}

extension Task: Comparable {
    static func < (lhs: Task, rhs: Task) -> Bool {
        switch (lhs, rhs) {
        case (.important(let leftImportant), .important(let rightImportant)):
            return leftImportant.taskPriorety.rawValue > rightImportant.taskPriorety.rawValue
        case (.important, .regular):
            return true
        default:
            return false
        }
    }
}


extension RegularTask: Equatable {
    static func == (lhs: RegularTask, rhs: RegularTask) -> Bool {
        return lhs.titel == rhs.titel && lhs.completed == rhs.completed
    }
}

extension ImportantTask: Equatable {
    static func == (lhs: ImportantTask, rhs: ImportantTask) -> Bool {
        return lhs.titel == rhs.titel &&
        lhs.taskStatus == rhs.taskStatus &&
        lhs.taskPriorety == rhs.taskPriorety &&
        lhs.dateCreationTask == rhs.dateCreationTask
    }
}


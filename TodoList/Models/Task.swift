//
//  Task.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import Foundation


class Task {
    let titel: String
    let completed: Bool
    
    init(titel: String, completed: Bool) {
        self.titel = titel
        self.completed = completed
    }
}

final class RegularTask: Task {
}

final class ImportantTask: Task {
    
    let taskPriorety: TaskPriority
    let dateCreationTask: Date
    
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
    
    init(titel: String, completed: Bool, taskPriorety: TaskPriority, date: Date) {
        self.taskPriorety = taskPriorety
        self.dateCreationTask = date
        
        super.init(titel: titel, completed: completed)
    }
}

enum TaskPriority {
    case low
    case medium
    case high
}

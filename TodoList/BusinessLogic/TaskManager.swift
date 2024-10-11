//
//  TaskManager.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import Foundation

/// Предоставляет список заданий
final class TaskManager: TaskManagerProtocol {
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
    
    func addTasks(tasks: [Task]) {
        tasks.forEach { task in
            taskList.append(task)
        }
    }
    
    func removeTask(task: Task) {
        /// Для удаления сравниванием объекты 
        taskList.removeAll { $0 === task }
    }
}

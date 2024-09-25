//
//  ViewController.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import UIKit


final class TodoListTableViewController: UITableViewController {
    var taskManager: TaskManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TodoList"

        setup()
    }
}

// MARK: - Table view data source

extension TodoListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskManager.getAllTasks().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = getTaskForIndex(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        configureCell(cell, with: task)
        
        return cell
    }
}

// MARK: - Private Metods
/// Конфигурация UI
private extension TodoListTableViewController {
    func setup() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func getTaskForIndex(_ indexPath: IndexPath) -> Task {
        taskManager.getAllTasks()[indexPath.row]
    }
    
    func configureCell(_ cell: UITableViewCell,with task: Task) {
        var contentConfiguration = cell.defaultContentConfiguration()

        if let task = task as? ImportantTask {
            contentConfiguration.secondaryText = "Deadline: \(task.deadLine.formatted())"
        }

        contentConfiguration.text = task.titel
        cell.contentConfiguration = contentConfiguration
    }
}




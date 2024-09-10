//
//  ViewController.swift
//  TodoList
//
//  Created by Denis Bokov on 21.08.2024.
//

import UIKit


final class TodoListTableViewController: UITableViewController {
    private var taskManager: TaskManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TodoList"

        setup()
    }

    private func setup() {
        taskManager = TaskManager()
        let tasks: [Task] = [
            ImportantTask(titel: "Сходить за хлебом", completed: false, taskPriorety: .low, date: Date()),
            ImportantTask(titel: "Убраться дома", completed: true, taskPriorety: .medium, date: Date()),
            ImportantTask(titel: "Сходить за хлебом", completed: false, taskPriorety: .high, date: Date()),
            RegularTask(titel: "Сходить за хлебом", completed: true)
        ]
        
        tasks.forEach { taskManager.addTask(task: $0) }

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func getTaskForIndex(_ indexPath: IndexPath) -> Task {
        taskManager.getAllTasks()[indexPath.row]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskManager.getAllTasks().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = getTaskForIndex(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfiguration = cell.defaultContentConfiguration()

        if let task = task as? ImportantTask {
            contentConfiguration.secondaryText = "Deadline: \(task.deadLine.formatted())"
        }

        contentConfiguration.text = task.titel
        cell.contentConfiguration = contentConfiguration

        return cell
    }
}




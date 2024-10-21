//
//  LoginViewController.swift
//  TodoList
//
//  Created by Denis Bokov on 14.10.2024.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    private lazy var loginTextField = makeTextFild()
    private lazy var passTextField = makeTextFild()
    private lazy var loginButton = makeButton()
    
    private var taskManager: TaskManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func login() {
        func assembly() -> UIViewController {

            let viewController = TodoListTableViewController(taskManager: buildTaskManager())

            return viewController
        }

        func buildTaskManager() -> TaskManagerProtocol {
            let taskManager = OrderdTaskManager(taskManager: TaskManager())
            
            let tasks: [Task] = [
                .important(ImportantTask(
                    titel: "Сходить за хлебом",
                    taskPriorety: .high,
                    dateCreationTask: Date(),
                    taskStatus: .notStarted)
                ),
                .important(ImportantTask(
                    titel: "Убраться дома",
                    taskPriorety: .medium,
                    dateCreationTask: Date(),
                    taskStatus: .notStarted)
                ),
                .important(ImportantTask(
                    titel: "SwiftUI",
                    taskPriorety: .high,
                    dateCreationTask: Date(),
                    taskStatus: .notStarted)
                ),
                .regular(RegularTask(titel: "Приготовить кофе", completed: true)),
                .important(ImportantTask(
                    titel: "труктуры данных",
                    taskPriorety: .low,
                    dateCreationTask: Date(),
                    taskStatus: .notStarted)
                )
            ]
            
            taskManager.addTasks(tasks: tasks)

            return taskManager
        }
        
        self.present(assembly(), animated: true)
    }
    
}

/// Настрока UI элементов
private extension LoginViewController {
    func makeTextFild() -> UITextField {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.borderWidth = Sizes.borderWidth
        textField.layer.cornerRadius = Sizes.cornerRadius
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }
    
    func makeButton() -> UIButton {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .medium
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.title = "Login"
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    func setup() {
        title = "Autorization"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(loginButton)
        view.addSubview(passTextField)
        view.addSubview(loginTextField)
        
        setupLayoutElements()
    }
    
    func setupLayoutElements() {
        NSLayoutConstraint.activate(
            [
                loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginTextField.topAnchor.constraint(
                    equalTo: view.topAnchor,
                    constant: view.bounds.size.height / 3
                ),
                loginTextField.widthAnchor.constraint(
                    equalTo: view.widthAnchor,
                    multiplier: Sizes.L.wightmultiplier
                ),
                loginTextField.heightAnchor.constraint(equalToConstant: Sizes.L.height),
                
                passTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                passTextField.topAnchor.constraint(
                    equalTo: loginTextField.bottomAnchor,
                    constant: Sizes.Padding.normal
                ),
                passTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Sizes.L.wightmultiplier),
                passTextField.heightAnchor.constraint(equalToConstant: Sizes.L.height),
                
                loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loginButton.topAnchor.constraint(
                    equalTo: passTextField.bottomAnchor,
                    constant: Sizes.Padding.double
                ),
                loginButton.widthAnchor.constraint(equalToConstant: Sizes.L.wigth),
                loginButton.heightAnchor.constraint(equalToConstant: Sizes.L.height),
            ]
        )
    }
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewController().preview()
        }
    }
}

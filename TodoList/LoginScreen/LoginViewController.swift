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
    
}

private extension LoginViewController {
    func makeTextFild() -> UITextField {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.layer.borderWidth = Sizes.borderWidth
        textField.layer.cornerRadius = Sizes.cornerRadius
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        return textField
    }
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        Group {
            LoginViewController().preview()
        }
    }
}

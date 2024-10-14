//
//  LoginViewController.swift
//  TodoList
//
//  Created by Denis Bokov on 14.10.2024.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
}

private extension LoginViewController {
    func makeTextFild() -> UITextField {
        let textField = UITextField()
        
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

//
//  UIViewController + Previw.swift
//  TodoList
//
//  Created by Denis Bokov on 14.10.2024.
//

import UIKit
import SwiftUI

extension UIViewController {
    struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
            
        func makeUIViewController(context: Context) -> some UIViewController {
                viewController
        }
            
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
    
    func preview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}

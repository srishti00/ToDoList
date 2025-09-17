//
//  TabBarControllerSetup.swift
//  ToDoList
//
//  Created by srisshar on 28/05/24.
//

import Foundation
import UIKit

class TabBarControllerSetup {
    static func setupTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        print("coming to setupTabBar")
        
        // ToDo View Controller
                let toDoViewController = ToDoViewController()
                let toDoNavigationController = UINavigationController(rootViewController: toDoViewController)
                toDoNavigationController.tabBarItem = UITabBarItem(title: "ToDo", image: UIImage(systemName: "list.bullet"), tag: 0)

        
        // Placeholder View Controller for the Add Button
        let placeholderViewController = UIViewController()
        
        placeholderViewController.tabBarItem.isEnabled = false // Disable user interaction for the placeholder tab
        

        // Profile View Controller
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Person", image: UIImage(systemName: "person.circle"), tag: 2)
        

        // Set up the tab bar controller
        tabBarController.viewControllers = [toDoViewController, placeholderViewController, profileNavigationController]

        // Customize the middle tab bar item (Add Button)
        let addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(systemName: "plus.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .bold, scale: .large)), for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        addButton.layer.cornerRadius = 32
        addButton.layer.masksToBounds = true
        addButton.center = CGPoint(x: tabBarController.tabBar.center.x, y: tabBarController.tabBar.bounds.minY - 32)
        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)

        // Add button to the tab bar controller's view
        tabBarController.view.addSubview(addButton)
        tabBarController.view.layoutIfNeeded()
        
        return tabBarController
    }
    
    @objc static func addTask() {
        let alert = UIAlertController(title: "New Task", message: "Enter a new task", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Task"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let task = alert.textFields?.first?.text, !task.isEmpty {
                NotificationCenter.default.post(name: Notification.Name("AddTask"), object: task)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(alert, animated: true, completion: nil)
        }
    }
}

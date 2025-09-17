//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by srisshar on 28/05/24.
//

import UIKit

class TaskCell {
    
    @IBOutlet weak var textLabel: UILabel!
}

class ToDoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "ToDo List"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
        // Set the navigation bar color
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = UIColor.systemBlue
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
        
        // Set the table view background color
           tableView.backgroundColor = UIColor.systemGroupedBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Listen for Add Task notifications
               NotificationCenter.default.addObserver(self, selector: #selector(didReceiveAddTaskNotification(_:)), name: Notification.Name("AddTask"), object: nil)
    }
    
    @objc func didReceiveAddTaskNotification(_ notification: Notification) {
            if let task = notification.object as? String {
                tasks.append(task)
                tableView.reloadData()
            }
        }
}
extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        // Set cell background color and text color
            cell.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.darkGray
            cell.textLabel?.text = tasks[indexPath.row]
            
            // Set rounded corners for the cell
            cell.layer.cornerRadius = 10
            cell.layer.masksToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

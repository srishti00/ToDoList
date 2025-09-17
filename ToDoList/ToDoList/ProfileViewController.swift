//
//  ProfileViewController.swift
//  ToDoList
//
//  Created by srisshar on 28/05/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Coming to profile view controller")
        view.backgroundColor = .white
        title = "Profile"
        
        // Add a simple label
        let profileLabel = UILabel()
        profileLabel.text = "Profile View"
        profileLabel.textAlignment = .center
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileLabel)
        
        // Center the label
        NSLayoutConstraint.activate([
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

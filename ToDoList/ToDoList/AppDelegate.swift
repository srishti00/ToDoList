//
//  AppDelegate.swift
//  ToDoList
//
//  Created by srisshar on 29/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
        var tabBarController: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
        // Create a placeholder view controller from the storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
            let placeholderViewController = storyboard.instantiateViewController(withIdentifier: "PlaceholderViewController") // Replace "PlaceholderViewController" with your placeholder view controller identifier
            
            // Set the placeholder view controller as the initial view controller
            window?.rootViewController = placeholderViewController// Placeholder root view controller
            window?.makeKeyAndVisible()
            
            // Delay setup of tab bar controller until after the view hierarchy of ToDoViewController is loaded
            DispatchQueue.main.async {
                self.setupTabBarController()
            }
            
            return true
        }
        
        func setupTabBarController() {
            tabBarController = TabBarControllerSetup.setupTabBarController()
            window?.rootViewController = tabBarController
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


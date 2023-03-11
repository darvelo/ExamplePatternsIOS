//
//  AppDelegate.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencies: Dependencies?
    var rootCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let deps = Dependencies()
        self.dependencies = deps

        let coordinator = deps.homeCoordinatorFactory()
        rootCoordinator = coordinator
        coordinator.start()

        let window = UIWindow()
        window.rootViewController = coordinator.rootViewController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}


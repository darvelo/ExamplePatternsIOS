//
//  Coordinator.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: Coordinator? { get }
    var rootViewController: UIViewController { get }
    func start()
}

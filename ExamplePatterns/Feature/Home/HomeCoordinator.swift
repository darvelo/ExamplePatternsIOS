//
//  HomeCoordinator.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {

    var childCoordinator: Coordinator?
    let rootViewController: UIViewController

    let homeVM: HomeVM
    let productDetailCoordinatorFactory: ProductDetailCoordinatorFactory

    init(homeVM: HomeVM, productDetailCoordinatorFactory: @escaping ProductDetailCoordinatorFactory) {
        rootViewController = HomeVC(homeVM: homeVM)
        self.homeVM = homeVM
        self.productDetailCoordinatorFactory = productDetailCoordinatorFactory
    }

    func start() {
        homeVM.onNavigationEvent = { [weak self] navigationEvent in
            guard let self else { return }
            switch navigationEvent {
            case .productDetail(let productId):
                let coordinator = self.productDetailCoordinatorFactory(productId)
                self.childCoordinator = coordinator
                coordinator.onNavigationEvent = self.handleProductDetailNavigationEvent(event:)
                coordinator.start()
                self.rootViewController.present(coordinator.rootViewController, animated: true)
            }
        }
    }

    func handleProductDetailNavigationEvent(event: ProductDetailVM.NavigationEvent) {
        switch event {
        case .disappear:
            childCoordinator = nil
        }
    }
}

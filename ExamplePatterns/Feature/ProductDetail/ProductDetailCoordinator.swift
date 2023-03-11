//
//  ProductDetailCoordinator.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import UIKit

class ProductDetailCoordinator: Coordinator {

    var childCoordinator: Coordinator?
    let rootViewController: UIViewController

    private let productDetailVM: ProductDetailVM
    var onNavigationEvent: ((ProductDetailVM.NavigationEvent) -> Void)?

    init(productDetailVM: ProductDetailVM) {
        rootViewController = ProductDetailVC(productDetailVM: productDetailVM)
        self.productDetailVM = productDetailVM
    }

    func start() {
        productDetailVM.onNavigationEvent = { [weak self] event in
            self?.onNavigationEvent?(event)
        }
    }
}

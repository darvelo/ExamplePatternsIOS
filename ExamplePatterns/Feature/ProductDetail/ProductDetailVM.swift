//
//  ProductDetailVM.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import Combine

class ProductDetailVM: ObservableObject {

    private var cancellables = [AnyCancellable]()

    @Published var state: State
    var onNavigationEvent: ((NavigationEvent) -> Void)?

    init(productId: String, readProductInteractor: ReadProductInteractor) {
        state = State()

        readProductInteractor.execute(productId: productId).sink { [weak self] product in
            guard let self else { return }
            self.state.product = product
        }
        .store(in: &cancellables)
    }

    func onDisappear() {
        onNavigationEvent?(.disappear)
    }

    struct State {
        var product: Product?
    }

    enum NavigationEvent {
        case disappear
    }
}

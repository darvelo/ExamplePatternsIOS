//
//  HomeVM.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import Combine

class HomeVM: ObservableObject {

    @Published var state: State

    private var cancellables = [AnyCancellable]()

    var onNavigationEvent: ((NavigationEvent) -> Void)?

    init(readProductListInteractor: ReadProductListInteractor) {
        state = State(productCards: [])

        readProductListInteractor.execute().map { products in
            return products.map { $0.asProductCardUiModel() }
        }
        .sink { [weak self] uiModels in
            guard let self else { return }
            self.state.productCards = uiModels
        }
        .store(in: &cancellables)
    }

    func onProductCardTap(uiModel: ProductCardUiModel) {
        onNavigationEvent?(.productDetail(productId: uiModel.id))
    }

    func onProductCardLongPress(uiModel: ProductCardUiModel) {
        let newCards = state.productCards.filter { $0.id != uiModel.id }
        state.productCards = newCards
    }

    struct State {
        var productCards: [ProductCardUiModel]
    }

    enum NavigationEvent {
        case productDetail(productId: String)
    }
}

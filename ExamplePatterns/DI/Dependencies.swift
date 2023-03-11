//
//  Dependencies.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation

typealias ProductDetailCoordinatorFactory = (_ productId: String) -> ProductDetailCoordinator

class Dependencies {

    private lazy var apiService = apiServiceFactory()
    private lazy var productRepo = productRepoFactory()

    func apiServiceFactory() -> ApiService {
        return ApiService()
    }

    func productRepoFactory() -> ProductRepo {
        return ProductRepo(apiService: apiService)
    }

    func readProductListInteractorFactory() -> ReadProductListInteractor {
        return ReadProductListInteractor(productRepo: productRepo)
    }

    func readProductInteractorFactory() -> ReadProductInteractor {
        return ReadProductInteractor(productRepo: productRepo)
    }

    func homeVMFactory() -> HomeVM {
        return HomeVM(readProductListInteractor: readProductListInteractorFactory())
    }

    func homeCoordinatorFactory() -> HomeCoordinator {
        return HomeCoordinator(homeVM: homeVMFactory(),
                               productDetailCoordinatorFactory: productDetailCoordinatorFactory)
    }

    func productDetailVMFactory(productId: String) -> ProductDetailVM {
        return ProductDetailVM(productId: productId, readProductInteractor: readProductInteractorFactory())
    }

    func productDetailCoordinatorFactory(productId: String) -> ProductDetailCoordinator {
        let vm = productDetailVMFactory(productId: productId)
        return ProductDetailCoordinator(productDetailVM: vm)
    }
}

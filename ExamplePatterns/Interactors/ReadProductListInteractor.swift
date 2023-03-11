//
//  ReadProductListInteractor.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import Combine

class ReadProductListInteractor {

    private let productRepo: ProductRepo

    init(productRepo: ProductRepo) {
        self.productRepo = productRepo
    }

    func execute() -> AnyPublisher<[Product], Never> {
        return productRepo.fetchProducts()
    }
}

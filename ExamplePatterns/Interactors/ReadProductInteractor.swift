//
//  ReadProductInteractor.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import Combine

class ReadProductInteractor {

    private let productRepo: ProductRepo

    init(productRepo: ProductRepo) {
        self.productRepo = productRepo
    }

    func execute(productId: String) -> AnyPublisher<Product?, Never> {
        return productRepo.fetchProduct(productId: productId)
    }
}

//
//  ApiService.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import Combine

class ApiService {

    private let products = [
        ProductDTO(id: "1", name: "First Product"),
        ProductDTO(id: "2", name: "Second Product"),
    ]

    func fetchProducts() -> AnyPublisher<[ProductDTO], Never> {
        return Just(products)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func fetchProduct(productId: String) -> AnyPublisher<ProductDTO?, Never> {
        let product = products.filter { $0.id == productId }.first
        return Just(product)
            .delay(for: 1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

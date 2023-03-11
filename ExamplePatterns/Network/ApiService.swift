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
        ProductDTO(id: "3", name: "Third Product"),
        ProductDTO(id: "4", name: "Fourth Product"),
        ProductDTO(id: "5", name: "Fifth Product"),
        ProductDTO(id: "6", name: "Sixth Product"),
        ProductDTO(id: "7", name: "Seventh Product"),
        ProductDTO(id: "8", name: "Eighth Product"),
        ProductDTO(id: "9", name: "Ninth Product"),
        ProductDTO(id: "10", name: "Tenth Product"),
        ProductDTO(id: "11", name: "Eleventh Product"),
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

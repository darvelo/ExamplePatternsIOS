//
//  ProductRepo.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import Combine

class ProductRepo {

    private let apiService: ApiService

    init(apiService: ApiService) {
        self.apiService = apiService
    }

    func fetchProducts() -> AnyPublisher<[Product], Never> {
        return apiService.fetchProducts().map { productDtos in
            return productDtos.map { $0.asProduct() }
        }
        .eraseToAnyPublisher()
    }

    func fetchProduct(productId: String) -> AnyPublisher<Product?, Never> {
        apiService.fetchProduct(productId: productId).map { productDto in
            return productDto?.asProduct()
        }
        .eraseToAnyPublisher()
    }
}

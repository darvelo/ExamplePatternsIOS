//
//  Product.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation

struct Product {
    let id: String
    let name: String
}

extension ProductDTO {
    func asProduct() -> Product {
        return Product(id: id,
                       name: name)
    }
}

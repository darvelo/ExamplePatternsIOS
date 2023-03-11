//
//  ProductCardUiModel.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation

struct ProductCardUiModel {
    let id: String
    let name: String
}

extension Product {

    func asProductCardUiModel() -> ProductCardUiModel {
        return ProductCardUiModel(id: id,
                                  name: name)
    }
}

//
//  ProductCardCell.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import UIKit

class ProductCardCell: UICollectionViewCell {

    var uiModel: ProductCardUiModel?

    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(uiModel: ProductCardUiModel) {
        self.uiModel = uiModel
        nameLabel.text = uiModel.name
    }

}

//
//  ProductDetailVC.swift
//  ExamplePatterns
//
//  Created by David Arvelo on 3/11/23.
//

import Foundation
import UIKit
import Combine

class ProductDetailVC: UIViewController {

    private let productDetailVM: ProductDetailVM
    private var cancellable: AnyCancellable?

    private let titleView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 40)
        return view
    }()

    init(productDetailVM: ProductDetailVM) {
        self.productDetailVM = productDetailVM
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleView)

        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])

        cancellable = productDetailVM.$state.sink { [weak self] state in
            self?.render(state: state)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        productDetailVM.onDisappear()
        super.viewWillDisappear(animated)
    }

    private func render(state: ProductDetailVM.State) {
        titleView.text = state.title
    }
}

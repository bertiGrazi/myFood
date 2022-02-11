//
//  CategoryListView.swift
//  MyFood
//
//  Created by Grazielli Berti on 10/02/22.
//

import Foundation
import UIKit

class CategoryListView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 122)
    }
    
    func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(categoryStackView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            categoryStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            categoryStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            categoryStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}

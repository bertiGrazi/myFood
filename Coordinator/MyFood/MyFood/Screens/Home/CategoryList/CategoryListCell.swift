//
//  CategoryListCell.swift
//  MyFood
//
//  Created by Grazielli Berti on 11/02/22.
//

import Foundation
import UIKit

class CategoryListCell: UIView {
    //MARK: - View
    let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.cornerRadius = 8
        stackView.backgroundColor = .systemYellow
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let categoryImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "category_pizza")
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Pizza"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
        configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
       addSubview(categoryStackView)
       categoryStackView.addArrangedSubview(categoryImageView)
       categoryStackView.addArrangedSubview(categoryLabel)
    }
    
    fileprivate func configureConstrains() {
        NSLayoutConstraint.activate([
            categoryStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            categoryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryStackView.topAnchor.constraint(equalTo: topAnchor),
            categoryStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryImageView.heightAnchor.constraint(equalToConstant: 54),
            categoryImageView.widthAnchor.constraint(equalToConstant: 54)
        ])
    }
}

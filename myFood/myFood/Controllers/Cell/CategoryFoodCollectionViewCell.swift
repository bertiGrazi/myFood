//
//  CategoryFoodCollectionViewCell.swift
//  myFood
//
//  Created by Grazielli Berti on 07/02/22.
//

import UIKit

class CategoryFoodCollectionViewCell: UICollectionViewCell {
    //MARK: - Variables
    static let identifier = "CategoryFoodCollectionViewCell"
    
    //MARK: - View
    let viewCategory: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.layer.shadowRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelCategory: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 15 : 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(viewCategory)
        viewCategory.addSubview(categoryImage)
        viewCategory.addSubview(labelCategory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            viewCategory.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            viewCategory.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            viewCategory.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            viewCategory.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            viewCategory.widthAnchor.constraint(equalToConstant: 100),
            viewCategory.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: viewCategory.topAnchor, constant: 12),
            categoryImage.leadingAnchor.constraint(equalTo: viewCategory.leadingAnchor, constant: 12),
            viewCategory.trailingAnchor.constraint(equalTo: viewCategory.trailingAnchor, constant: 12),
            categoryImage.widthAnchor.constraint(equalToConstant: 50),
            categoryImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            labelCategory.centerXAnchor.constraint(equalTo: viewCategory.centerXAnchor, constant: 0),
            labelCategory.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 12)
        ])
    }
    
    func configure(for listProduct: CategoryListDataSource) {
        categoryImage.image = listProduct.imageCategory.image
        labelCategory.text = listProduct.categoryProduct
    }
}

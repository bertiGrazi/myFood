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
        view.backgroundColor = .link
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "category_pasta")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.layer.shadowRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelCategory: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 10 : 10)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryImage)
        contentView.addSubview(labelCategory)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            categoryImage.widthAnchor.constraint(equalToConstant: 50),
            categoryImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            labelCategory.topAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: 5)
        ])
    }
    
    func configure(for listProduct: CategoryList) {
        categoryImage.image = listProduct.imageCategory.image
        labelCategory.text = listProduct.categoryProduct
    }
}

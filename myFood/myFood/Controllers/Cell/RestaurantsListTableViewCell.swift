//
//  RestaurantsListTableViewCell.swift
//  myFood
//
//  Created by Grazielli Berti on 09/02/22.
//

import UIKit

class RestaurantsListTableViewCell: UITableViewCell {
    static let reuseIdentifier = "restaurantsListTableViewCell"
    
    let imageRestaurant: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameRestaurant: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 15 : 15)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryRestaurant: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 10 : 10)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let distanceRestaurant: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.width <= 375 ? 10 : 10)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: RestaurantsListTableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        contentView.addSubview(imageRestaurant)
        contentView.addSubview(nameRestaurant)
        contentView.addSubview(categoryRestaurant)
        contentView.addSubview(distanceRestaurant)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            imageRestaurant.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageRestaurant.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageRestaurant.widthAnchor.constraint(equalToConstant: 200),
            imageRestaurant.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameRestaurant.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameRestaurant.trailingAnchor.constraint(equalTo: imageRestaurant.trailingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            categoryRestaurant.topAnchor.constraint(equalTo: nameRestaurant.bottomAnchor, constant: 5),
            categoryRestaurant.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            distanceRestaurant.topAnchor.constraint(equalTo: nameRestaurant.bottomAnchor, constant: 5),
            distanceRestaurant.trailingAnchor.constraint(equalTo: categoryRestaurant.trailingAnchor, constant: 60)
        ])
    }
    
    func config(for restaurantsList: RestaurantsListDataSource) {
        imageView?.image = restaurantsList.imageRestaurant.image
        nameRestaurant.text = restaurantsList.nameRestaurant
        categoryRestaurant.text = restaurantsList.categoryRestaurant
        distanceRestaurant.text = restaurantsList.distanceRestaurant
    }
}

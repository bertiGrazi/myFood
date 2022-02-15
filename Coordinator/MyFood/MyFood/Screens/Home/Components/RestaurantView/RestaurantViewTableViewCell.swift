//
//  RestaurantViewTableViewCell.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation
import UIKit

class RestaurantViewTableViewCell: UITableViewCell {
    //MARK: Variables
    static let reuseIdentifier = "RestaurantViewTableViewCell"
    
    //MARK: View
    let restaurantStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.spacing = 12
        stackview.axis = .vertical
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let nameRestaurantLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryRestaurantLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = .systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        configureConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        addSubview(restaurantStackView)
        restaurantStackView.addSubview(nameRestaurantLabel)
        restaurantStackView.addSubview(categoryRestaurantLabel)
    }
    
    fileprivate func configureConstrains() {
        NSLayoutConstraint.activate([
            restaurantStackView.topAnchor.constraint(equalTo: topAnchor),
            restaurantStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            restaurantStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            restaurantStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    func configCell(data: RestaurantListModel) {
        nameRestaurantLabel.text = data.nameRestaurant
        categoryRestaurantLabel.text = data.categoryRestaurant
    }
}

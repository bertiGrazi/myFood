//
//  HomeView.swift
//  MyFood
//
//  Created by Grazielli Berti on 10/02/22.
//

import UIKit

class HomeView: UIView {
    //MARK: - Views
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray5
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.backgroundColor = .systemGray5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let promoListView: PromoListView = {
        let promoListView = PromoListView()
        promoListView.translatesAutoresizingMaskIntoConstraints = false
        return promoListView
    }()
    
    let categoryListView: CategoryListView = {
        let categoryListView = CategoryListView()
        categoryListView.translatesAutoresizingMaskIntoConstraints = false
        return categoryListView
    }()
    
    let restaurantListView: RestaurantView = {
        let restaurantListView = RestaurantView()
        restaurantListView.translatesAutoresizingMaskIntoConstraints = false
        return restaurantListView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(promoListView)
        stackView.addArrangedSubview(categoryListView)
        stackView.addArrangedSubview(restaurantListView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
}

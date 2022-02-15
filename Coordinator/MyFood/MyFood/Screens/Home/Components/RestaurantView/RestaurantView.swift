//
//  RestaurantView.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation
import UIKit

class RestaurantView: UIView {
    //MARK: - Variables
    let viewModel = RestarauntListViewModel()
    
    let restaurantTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RestaurantViewTableViewCell.self, forCellReuseIdentifier: RestaurantViewTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        
        restaurantTableView.dataSource = self
        restaurantTableView.delegate = self
        
        setupViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(restaurantTableView)
    }
    
    fileprivate func configureConstraints() {
        NSLayoutConstraint.activate([
            restaurantTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            restaurantTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            restaurantTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            restaurantTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            restaurantTableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, constant: 1000)
        ])
    }
}

//MARK: - UITableViewDelegate
extension RestaurantView: UITableViewDelegate {
}

//MARK: - UITableViewDataSource
extension RestaurantView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fetchRestarauntList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantViewTableViewCell.reuseIdentifier, for: indexPath) as? RestaurantViewTableViewCell else { return UITableViewCell() }
        cell.configCell(data: viewModel.fetchRestarauntList()[indexPath.row])
        return cell
    }
}

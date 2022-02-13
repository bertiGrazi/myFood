//
//  RestaurantView.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation
import UIKit

class RestaurantView: UIView {
    
    let restaurantTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RestaurantViewTableViewCell.self, forCellReuseIdentifier: RestaurantViewTableViewCell.reuseIdentifier)
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        
    }
    
    fileprivate func configureConstraints() {
        
    }
}

////MARK: - UITableViewDelegate
//extension HomeView: UITableViewDelegate {
//}
//
////MARK: - UITableViewDataSource
//extension HomeView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//}

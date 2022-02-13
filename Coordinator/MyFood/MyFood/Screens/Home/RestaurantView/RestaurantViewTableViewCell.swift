//
//  RestaurantViewTableViewCell.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation
import UIKit

class RestaurantViewTableViewCell: UITableViewCell {
    static let reuseIdentifier = "RestaurantViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

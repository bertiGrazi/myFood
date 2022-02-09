//
//  RestaurantsListProtocol.swift
//  myFood
//
//  Created by Grazielli Berti on 09/02/22.
//

import Foundation

protocol RestaurantsListProtocol {
    func fetchRestaurantsListDataSource() -> [RestaurantsListDataSource]
}

//
//  RestaurantListViewModel.swift
//  myFood
//
//  Created by Grazielli Berti on 09/02/22.
//

import Foundation

class RestaurantListViewModel {
    var businessModel: RestaurantsListProtocol = RestaurantsListBusinessModel()
    
    func fetchRestaurantList() -> [RestaurantsListDataSource] {
        businessModel.fetchRestaurantsListDataSource()
    }
}

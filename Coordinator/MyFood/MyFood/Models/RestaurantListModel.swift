//
//  RestaurantListModel.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//
import Foundation

class RestaurantListModel: Codable {
    var nameRestaurant: String
    var categoryRestaurant: String
    
    init(nameRestaurant: String, categoryRestaurant: String) {
        self.nameRestaurant = nameRestaurant
        self.categoryRestaurant = categoryRestaurant
    }
}

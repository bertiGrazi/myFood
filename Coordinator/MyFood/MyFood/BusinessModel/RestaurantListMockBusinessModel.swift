//
//  RestaurantListMockBusinessModel.swift
//  MyFood
//
//  Created by Grazielli Berti on 15/02/22.
//

import Foundation

class RestaurantListMockBusinessModel: RestaurantListMockProtocol {
    func restaurantListMock() -> [RestaurantListModel] {
        return [
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
            RestaurantListModel(nameRestaurant: "Padaria City", categoryRestaurant: "Padaria"),
        ]
    }
}

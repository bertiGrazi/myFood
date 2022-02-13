//
//  MyFoodDeliveryApiServiceProtocol.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

protocol MyFoodDeliveryApiServiceProtocol {
    func fetchRestaurant(_ completion: @escaping (Result<[RestaurantListModel], MyFoodServiceError>) -> Void)
}

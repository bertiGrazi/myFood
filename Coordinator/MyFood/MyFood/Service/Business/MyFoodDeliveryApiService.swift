//
//  MyFoodDeliveryApiService.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

struct MyFoodDeliveryApiService: MyFoodDeliveryApiServiceProtocol {
    
    private let myFoodDeliveryApiServiceProtocol: MyFoodDeliveryApiServiceProtocol
    
    init(myFoodDeliveryApiServiceProtocol: MyFoodDeliveryApiServiceProtocol = MyFoodBusinessModel()) {
        self.myFoodDeliveryApiServiceProtocol = myFoodDeliveryApiServiceProtocol
    }
    
    func fetchRestaurant(_ completion: @escaping (Result<[RestaurantListModel], MyFoodServiceError>) -> Void) {
        myFoodDeliveryApiServiceProtocol.fetchRestaurant { result in
            switch result {
            case .success(let restaurantList):
                completion(.success(restaurantList))
                
            case .failure:
                completion(.failure(.emptyData))
            }
        }
    }
}

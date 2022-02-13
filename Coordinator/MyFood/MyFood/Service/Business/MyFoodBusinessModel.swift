//
//  MyFoodBusinessModel.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

final class MyFoodBusinessModel: MyFoodDeliveryApiServiceProtocol {
    private let myFoodManagerService: MyFoodManagerProtocol
    
    init(myFoodManagerService: MyFoodManagerProtocol = MyFoodManagerService()) {
        self.myFoodManagerService = myFoodManagerService
    }
    
    func fetchRestaurant(_ completion: @escaping (Result<[RestaurantListModel], MyFoodServiceError>) -> Void) {
        myFoodManagerService.getRequest(request: Router.fetchRestaurantsList.getRequest) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode([RestaurantListModel].self, from: data)
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

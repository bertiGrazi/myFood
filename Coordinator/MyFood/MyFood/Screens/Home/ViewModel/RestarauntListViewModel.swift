//
//  RestarauntListViewModel.swift
//  MyFood
//
//  Created by Grazielli Berti on 15/02/22.
//

import Foundation

class RestarauntListViewModel {
    private let businessModel: RestaurantListMockProtocol = RestaurantListMockBusinessModel()
    
    func fetchRestarauntList() -> [RestaurantListModel] {
        return businessModel.restaurantListMock()
    }
}

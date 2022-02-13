//
//  Router.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation
import UIKit

enum Router {
    case fetchRestaurantsList
    
    static private let baseURL: String = "https://github.com/bertiGrazi/myFood/tree/main/Coordinator/MyFood/MyFoodApi/Api"
    
    private var path: String {
        switch self {
        case .fetchRestaurantsList:
            return "/restaurant_list.json"
        }
    }
    
    var url: URL {
        URL(string: Self.baseURL+self.path)!
    }
    
    var getRequest: URLRequest {
        var request = URLRequest(url: self.url)
        request.httpMethod = "GET"
        return request
    }
}


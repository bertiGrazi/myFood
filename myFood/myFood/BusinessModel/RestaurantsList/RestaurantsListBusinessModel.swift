//
//  RestaurantsListBusinessModel.swift
//  myFood
//
//  Created by Grazielli Berti on 09/02/22.
//

import Foundation
import UIKit

class RestaurantsListBusinessModel: RestaurantsListProtocol {
    func fetchRestaurantsListDataSource() -> [RestaurantsListDataSource] {
        return [
           RestaurantsListDataSource(imageRestaurant: UIImageView(image: UIImage(named: "restarant_market_sonda")), nameRestaurant: "Sonda Supermercado", categoryRestaurant: "Mercado", distanceRestaurant: "23-33 min"),
            RestaurantsListDataSource(imageRestaurant: UIImageView(image: UIImage(named: "restarant_market_sonda")), nameRestaurant: "Sonda Supermercado", categoryRestaurant: "Mercado", distanceRestaurant: "23-33 min"),
            RestaurantsListDataSource(imageRestaurant: UIImageView(image: UIImage(named: "restarant_market_sonda")), nameRestaurant: "Sonda Supermercado", categoryRestaurant: "Mercado", distanceRestaurant: "23-33 min"),
            RestaurantsListDataSource(imageRestaurant: UIImageView(image: UIImage(named: "restarant_market_sonda")), nameRestaurant: "Sonda Supermercado", categoryRestaurant: "Mercado", distanceRestaurant: "23-33 min"),
            RestaurantsListDataSource(imageRestaurant: UIImageView(image: UIImage(named: "restarant_market_sonda")), nameRestaurant: "Sonda Supermercado", categoryRestaurant: "Mercado", distanceRestaurant: "23-33 min"),
            RestaurantsListDataSource(imageRestaurant: UIImageView(image: UIImage(named: "restarant_market_sonda")), nameRestaurant: "Sonda Supermercado", categoryRestaurant: "Mercado", distanceRestaurant: "23-33 min"),
        ]
    }
}

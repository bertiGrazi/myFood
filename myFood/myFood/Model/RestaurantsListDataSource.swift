//
//  RestaurantsListDataSource.swift
//  myFood
//
//  Created by Grazielli Berti on 09/02/22.
//

import Foundation
import UIKit

class RestaurantsListDataSource {
    var imageRestaurant = UIImageView()
    var nameRestaurant: String
    var categoryRestaurant: String
    var distanceRestaurant: String
    
    init(imageRestaurant: UIImageView, nameRestaurant: String, categoryRestaurant: String, distanceRestaurant: String) {
        self.imageRestaurant = imageRestaurant
        self.nameRestaurant = nameRestaurant
        self.categoryRestaurant = categoryRestaurant
        self.distanceRestaurant = distanceRestaurant
    }
}

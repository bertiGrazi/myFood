//
//  CategoryList.swift
//  myFood
//
//  Created by Grazielli Berti on 07/02/22.
//

import Foundation
import UIKit

class CategoryList {
    var imageCategory = UIImageView()
    var categoryProduct: String
    
    init(imageCategory: UIImageView, categoryProduct: String) {
        self.imageCategory = imageCategory
        self.categoryProduct = categoryProduct
    }
}

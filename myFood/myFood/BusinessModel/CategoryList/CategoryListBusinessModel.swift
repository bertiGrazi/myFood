//
//  CategoryListBusinessModel.swift
//  myFood
//
//  Created by Grazielli Berti on 08/02/22.
//

import Foundation
import UIKit

class CategoryListBusinessModel: CategoryListProtocol {
    func fetchCategoryListDataSource() -> [CategoryListDataSource] {
        return [
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_market")),
                                   categoryProduct: "Mercado"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_sweet")),
                                   categoryProduct: "Doces"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_pasta")),
                                   categoryProduct: "Massa"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_japonese")),
                                   categoryProduct: "Japonês"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_fastfood")),
                                   categoryProduct: "Lanches"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_brasilianFood")),
                                   categoryProduct: "Brasileira"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_healthy")),
                                   categoryProduct: "Saudável"),
            CategoryListDataSource(imageCategory: UIImageView(image: UIImage(named: "category_arabic")),
                                   categoryProduct: "Árabe"),
        ]
    }
}

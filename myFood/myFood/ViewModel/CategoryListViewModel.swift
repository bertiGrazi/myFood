//
//  CategoryListViewModel.swift
//  myFood
//
//  Created by Grazielli Berti on 08/02/22.
//

import Foundation

class CategoryListViewModel {
    var businessModel: CategoryListProtocol = CategoryListBusinessModel()
    
    func fetchCategoryList() -> [CategoryListDataSource] {
        businessModel.fetchCategoryListDataSource()
    }
}

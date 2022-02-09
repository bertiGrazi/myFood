//
//  CategoryListProtocol.swift
//  myFood
//
//  Created by Grazielli Berti on 08/02/22.
//

import Foundation

protocol CategoryListProtocol {
    func fetchCategoryListDataSource() -> [CategoryListDataSource]
}

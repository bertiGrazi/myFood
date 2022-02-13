//
//  MyFoodManagerProtocol.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

protocol MyFoodManagerProtocol {
    var session: URLSession { get }
    func getRequest(request: URLRequest, completion: @escaping(Result<Data, MyFoodServiceError>) -> Void)
}

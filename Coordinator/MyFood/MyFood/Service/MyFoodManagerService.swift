//
//  MyFoodManagerService.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

final class MyFoodManagerService: MyFoodManagerProtocol {
    var session: URLSession
    private var dataTask: URLSessionTask?
    
    init(_ session: URLSession = .shared) {
        self.session = session
    }
    
    deinit {
        dataTask?.cancel()
    }
    
    func getRequest(request: URLRequest, completion: @escaping (Result<Data, MyFoodServiceError>) -> Void) {
        dataTask = session.dataTask(with: request) { [weak self] data, request, error  in
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(.requestFailed(description: error.localizedDescription)))
                return
            }
            
            guard let data = data, !data.isEmpty else {
                completion(.failure(.emptyData))
                return
            }
            
            completion(.success(data))
        }
        
        dataTask?.resume()
    }
}

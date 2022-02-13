//
//  MyFoodError.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

public struct MyFoodServiceError: Error {
    public enum ServiceError: Error {
        case requestFailed(description: String)
        case emptyData
        case decodeError
    }
    
    private var serviceError: ServiceError
    
    var errorKind: String {
        switch self.serviceError {
        case .requestFailed(description: let description):
            return "Could not run request because: \(description)"
            
        case .emptyData:
            return "No error was received but we also don't have data."
        
        case .decodeError:
            return "Could not decoded result"
        }
    }
}


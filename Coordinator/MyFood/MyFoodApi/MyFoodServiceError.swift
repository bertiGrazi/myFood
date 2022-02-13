//
//  MyFoodServiceError.swift
//  MyFood
//
//  Created by Grazielli Berti on 13/02/22.
//

import Foundation

public enum MyFoodServiceError: Error {
    case requestFailed(description: String)
    case emptyData
    case decodeError
    
    public var errorKind: String {
        switch self {
        case .requestFailed(description: let description):
            return "Could not run request because: \(description)"
            
        case .emptyData:
            return "No error was received but we also don't have data."
            
        case .decodeError:
            return "Could not decoded result"
        }
    }
}

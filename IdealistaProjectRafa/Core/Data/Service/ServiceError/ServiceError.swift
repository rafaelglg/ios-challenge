//
//  ServiceError.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

enum ServiceError: Error, LocalizedError {
    case badUrl
    
    var errorDescription: String? {
        switch self {
        case .badUrl:           return "The url provided ir not valid"
        }
    }
}

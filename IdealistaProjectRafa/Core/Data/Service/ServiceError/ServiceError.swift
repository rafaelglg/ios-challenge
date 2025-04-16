//
//  ServiceError.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

enum ServiceError: Error, LocalizedError {
    case badUrl
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .badUrl:           return "The url provided ir not valid"
        case .decodingFailed:   return "The JSON decoding failed"
        }
    }
}

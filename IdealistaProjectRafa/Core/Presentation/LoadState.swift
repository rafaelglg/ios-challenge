//
//  LoadState.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import Foundation

enum LoadState: Equatable {
    case initial
    case loading
    case success([IdealistaModel])
    case failure(Error)
    
    static func == (lhs: LoadState, rhs: LoadState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.success(let lhsModels), .success(let rhsModels)):
            return lhsModels == rhsModels
        case (.failure(let lhsError), .failure(let rhsError)):
            return (lhsError as NSError).domain == (rhsError as NSError).domain &&
                   (lhsError as NSError).code == (rhsError as NSError).code
        default:
            return false
        }
    }
}

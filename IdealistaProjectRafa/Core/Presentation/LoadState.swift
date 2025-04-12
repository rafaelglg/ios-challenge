//
//  LoadState.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 12/4/25.
//

enum LoadState {
    case initial
    case loading
    case success([IdealistaModel])
    case failure(Error)
}

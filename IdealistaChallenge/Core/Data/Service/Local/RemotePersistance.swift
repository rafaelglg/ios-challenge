//
//  RemotePersistance.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 13/4/25.
//

// This persistance can be use to save in remote like firebase, cloudKit ... Will be here as example
struct RemotePersistance: IdealistaPersistance {
    func addFavorite(from model: IdealistaModel) throws { }
    func getFavorites() throws -> [IdealistaModel] { IdealistaModel.mocks }
    func removeFromFavorites(with id: String) throws { }
}

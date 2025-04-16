//
//  IdealistaRepository.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaRepository: Sendable {
    func fetchIdealistaInfo() async throws -> [IdealistaModel]
    func addFavoriteToLocal(_ favorite: IdealistaModel) async throws
    @MainActor func getFavoritesFromLocal() throws -> [IdealistaModel]
    @MainActor func removeFromFavorites(with id: String) throws
}

struct IdealistaRepositoryImpl: IdealistaRepository {
    let local: IdealistaPersistance
    let remote: IdealistaService
    
    func fetchIdealistaInfo() async throws -> [IdealistaModel] {
        try await remote.fetchIdelistaData()
    }
    
    func addFavoriteToLocal(_ favorite: IdealistaModel) async throws {
        try await local.addFavorite(from: favorite)
    }
    
    @MainActor func getFavoritesFromLocal() throws -> [IdealistaModel] {
        try local.getFavorites()
    }
    
    @MainActor func removeFromFavorites(with id: String) throws {
        try local.removeFromFavorites(with: id)
    }
}

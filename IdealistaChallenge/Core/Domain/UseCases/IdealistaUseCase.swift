//
//  IdealistaUseCase.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaUseCase: Sendable {
    func execute() async throws -> [IdealistaModel]
    func executeAddFavorites(from model: IdealistaModel) async throws
    @MainActor func executeGetFavoritesFromLocal() throws -> [IdealistaModel]
    @MainActor func removeFromFavorites(with id: String) throws
}

struct IdealistaUseCaseImpl: IdealistaUseCase {
    
    let repository: IdealistaRepository
    
    func execute() async throws -> [IdealistaModel] {
        try await repository.fetchIdealistaInfo()
    }
    
    func executeAddFavorites(from model: IdealistaModel) async throws {
        try await repository.addFavoriteToLocal(model)
    }
    
    @MainActor func executeGetFavoritesFromLocal() throws -> [IdealistaModel] {
        try repository.getFavoritesFromLocal()
    }
    
    @MainActor func removeFromFavorites(with id: String) throws {
        try repository.removeFromFavorites(with: id)
    }
}

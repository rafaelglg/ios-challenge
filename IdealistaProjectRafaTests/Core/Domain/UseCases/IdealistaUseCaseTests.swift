//
//  IdealistaUseCaseTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class IdealistaUseCaseTests: XCTestCase {
    
    var sut: IdealistaUseCase?
    let repositoryMock = IdealistaRepositoryMock()

    override func setUpWithError() throws {
        sut = IdealistaUseCaseImpl(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Execute_Success() async throws {
        let model = try await sut?.execute()
        XCTAssertEqual(model, IdealistaModel.mocks)
    }
    
    func test_executeAddFavorites() async throws {
        let model = IdealistaModel.mock
        try await sut?.executeAddFavorites(from: model)
        XCTAssertEqual(model, IdealistaModel.mock)
    }
    
    func test_executeGetFavoritesFromLocal() async throws {
        let model = try await sut?.executeGetFavoritesFromLocal()
        XCTAssertEqual(model, IdealistaModel.mocks)
    }
    
    func test_removeFromFavorites() async throws {
        let id = "test id"
        try await sut?.removeFromFavorites(with: id)
        XCTAssertTrue(repositoryMock.didCallRemoveFavorite)
        XCTAssertEqual(id, repositoryMock.removedFavoriteId)
    }
}

final class IdealistaRepositoryMock: IdealistaRepository, @unchecked Sendable {
    
    private(set) var didCallAddFavorite = false
    private(set) var addedFavorite: IdealistaModel?
    
    private(set) var didCallRemoveFavorite = false
    private(set) var removedFavoriteId: String?
    
    func addFavoriteToLocal(_ favorite: IdealistaModel) async throws {
        didCallAddFavorite = true
        addedFavorite = favorite
    }
    
    func getFavoritesFromLocal() throws -> [IdealistaModel] {
        IdealistaModel.mocks
    }
    
    func removeFromFavorites(with id: String) throws {
        didCallRemoveFavorite = true
        removedFavoriteId = id
    }
    
    func fetchIdealistaInfo() async throws -> [IdealistaModel] {
        IdealistaModel.mocks
    }
}

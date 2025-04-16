//
//  IdealistaChallengeTests.swift
//  IdealistaRepositoryTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaChallenge

@MainActor
final class IdealistaRepositoryTests: XCTestCase {
    
    let remoteService: IdealistaService = IdealistaDetailServiceMock()
    let localService = LocalPersistanceMock()
    var sut: IdealistaRepository?

    override func setUpWithError() throws {
        sut = IdealistaRepositoryImpl(local: localService, remote: remoteService)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_FetchIdealistaInfo_Success() async throws {
        let model = try await sut?.fetchIdealistaInfo()
        XCTAssertEqual(model, IdealistaModel.mocks)
    }
    
    func test_addFavoriteToLocal_Success() async throws {
        let mockModel = IdealistaModel.mock
        try await sut?.addFavoriteToLocal(mockModel)
        XCTAssertTrue(localService.didCallAddFavorite)
        XCTAssertEqual(localService.addedFavorite, mockModel)
    }
    
    func test_getFavoritesFromLocal_returnsExpectedFavorites() throws {
        let result = try sut?.getFavoritesFromLocal()
        XCTAssertEqual(result, IdealistaModel.mocks, "Should return mocked local favorites")
    }
    
    func test_removeFromFavorites_callsRemoveFavorite() throws {
        let testId = "mockId123"
        try sut?.removeFromFavorites(with: testId)

        XCTAssertTrue(localService.didCallRemoveFavorite)
        XCTAssertEqual(localService.removedFavoriteId, testId, "Expected correct ID to be passed for removal")
    }
}

final class LocalPersistanceMock: IdealistaPersistance {
    
    private(set) var didCallAddFavorite = false
    private(set) var addedFavorite: IdealistaModel?
    
    private(set) var didCallRemoveFavorite = false
    private(set) var removedFavoriteId: String?
    
    func addFavorite(from model: IdealistaModel) {
        didCallAddFavorite = true
        addedFavorite = model
    }
    
    func removeFromFavorites(with id: String) throws {
        didCallRemoveFavorite = true
        removedFavoriteId = id
    }
    
    func getFavorites() throws -> [IdealistaModel] {
        IdealistaModel.mocks
    }
}

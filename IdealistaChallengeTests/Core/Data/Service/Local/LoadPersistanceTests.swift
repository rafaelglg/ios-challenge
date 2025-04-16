//
//  LoadPersistanceTests.swift
//  IdealistaChallengeTests
//
//  Created by Rafael Loggiodice on 14/4/25.
//

import XCTest
@testable import IdealistaChallenge
import SwiftData

@MainActor
final class LoadPersistanceTests: XCTestCase {
    
    var container: ModelContainer!
    var sut: LocalPersistanceImpl?
    
    override func setUpWithError() throws {
        let schema = Schema([IdealistaEntity.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: schema, configurations: [config])
        sut = LocalPersistanceImpl(container: container)
    }
    
    override func tearDownWithError() throws {
        container = nil
        sut = nil
    }
    
    func test_addFavorite_addsEntityToContext() throws {
        let model = IdealistaModel.mock
        try sut?.addFavorite(from: model)

        let favorites = try sut?.getFavorites()
        XCTAssertEqual(favorites?.count, 1)
        XCTAssertEqual(favorites?.first?.propertyCode, model.propertyCode)
    }

    func test_getFavorites_returnsEmptyInitially() throws {
        let favorites = try sut?.getFavorites()
        XCTAssertTrue(favorites?.isEmpty == true)
    }
    
    func test_removeFromFavorites_removesEntityWithMatchingId() throws {
        let model = IdealistaModel.mock
        try sut?.addFavorite(from: model)

        XCTAssertEqual(try sut?.getFavorites().count, 1)

        try sut?.removeFromFavorites(with: model.propertyCode)
        let favoritesAfter = try sut?.getFavorites()
        XCTAssertTrue(favoritesAfter?.isEmpty == true)
    }
}

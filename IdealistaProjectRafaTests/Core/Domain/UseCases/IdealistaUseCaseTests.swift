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

    override func setUpWithError() throws {
        let repositoryMock = IdealistaRepositoryMock()
        sut = IdealistaUseCaseImpl(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Execute_Success() async throws {
        let model = try await sut?.execute()
        XCTAssertEqual(model, IdealistaModel.mocks)
    }
}

final class IdealistaRepositoryMock: IdealistaRepository {
    func fetchIdealistaInfo() async throws -> [IdealistaModel] {
        IdealistaModel.mocks
    }
}

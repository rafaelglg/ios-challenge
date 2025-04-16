//
//  IdealistaDetatilUseCaseTests.swift
//  IdealistaDetatilUseCaseTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaChallenge

final class IdealistaDetatilUseCaseTests: XCTestCase {
    
    var sut: IdealistaDetailUseCase?

    override func setUpWithError() throws {
        let repositoryMock = IdealistaDetailRepositoryMock()
        sut = IdealistaDetailUseCaseImpl(repository: repositoryMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Execute_Success() async throws {
        let model = try await sut?.execute()
        XCTAssertEqual(model?.moreCharacteristics, IdealistaDetail.mock.moreCharacteristics)
    }
}

final class IdealistaDetailRepositoryMock: IdealistaDetailRepository {
    func fetchDetailInfo() async throws -> IdealistaDetail {
        IdealistaDetail.mock
    }
}

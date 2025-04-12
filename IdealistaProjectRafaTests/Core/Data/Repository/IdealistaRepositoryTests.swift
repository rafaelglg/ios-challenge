//
//  IdealistaProjectRafaTests.swift
//  IdealistaRepositoryTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class IdealistaRepositoryTests: XCTestCase {
    
    var sut: IdealistaRepository?

    override func setUpWithError() throws {
        let service: IdealistaService = IdealistaDetailServiceMock()
        sut = IdealistaRepositoryImpl(service: service)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_FetchIdealistaInfo_Success() async throws {
        let model = try await sut?.fetchIdealistaInfo()
        XCTAssertEqual(model, IdealistaModel.mocks)
    }
}

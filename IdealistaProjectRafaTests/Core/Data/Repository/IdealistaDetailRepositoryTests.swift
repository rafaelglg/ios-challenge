//
//  IdealistaDetailRepositoryTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class IdealistaDetailRepositoryTests: XCTestCase {
    
    var sut: IdealistaDetailRepository?
    
    override func setUpWithError() throws {
        let service: IdealistaService = IdealistaDetailServiceMock()
        sut = IdealistaDetailRepositoryImpl(service: service)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_FetchIdealistaDetailInfo_Success() async throws {
        let model = try await sut?.fetchDetailInfo()
        XCTAssertEqual(model?.ubication, IdealistaDetail.mock.ubication)
    }
}

//
//  IdealistaDetailViewModelTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

@MainActor
final class IdealistaDetailViewModelTests: XCTestCase {
    
    var detailUseCase = IdealistaDetailUseCaseMock()
    var sut: IdealistaDetailViewModel?

    override func setUpWithError() throws {
        sut = IdealistaDetailViewModelImpl(detailUseCase: detailUseCase)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_onAppear_successLoadsModel() async {
        
        let expectedModel = IdealistaDetail.mock
        await sut?.onAppear()
        XCTAssertEqual(sut?.idealistaDetailModel?.moreCharacteristics, expectedModel.moreCharacteristics)
    }
}

struct IdealistaDetailUseCaseMock: IdealistaDetailUseCase {
    
    func execute() async throws -> IdealistaDetail {
        IdealistaDetail.mock
    }
}

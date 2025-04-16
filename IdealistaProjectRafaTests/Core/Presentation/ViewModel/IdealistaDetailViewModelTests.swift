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
    
    func test_onAppear_shouldFail() async {
        var detailUseCase = IdealistaDetailUseCaseMock(shouldFail: true)
        let sut = IdealistaDetailViewModelImpl(detailUseCase: detailUseCase)
        detailUseCase.shouldFail = true
        await sut.onAppear()
        if case .failure(let error) = sut.loadState {
            XCTAssertNotNil(error)
        } else {
            XCTFail("Expected loadState to be .failure")
        }
    }
}

struct IdealistaDetailUseCaseMock: IdealistaDetailUseCase {
    
    var shouldFail: Bool
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func execute() async throws -> IdealistaDetail {
        if shouldFail {
            throw NSError(domain: "Error execute testing", code: 0, userInfo: nil)
        } else {
            IdealistaDetail.mock
        }
    }
}

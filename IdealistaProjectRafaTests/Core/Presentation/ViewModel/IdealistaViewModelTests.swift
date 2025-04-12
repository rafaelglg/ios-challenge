//
//  IdealistaViewModelTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

@MainActor
final class IdealistaViewModelTests: XCTestCase {
    
    var useCaseMock = IdealistaUseCaseMock()
    var sut: IdealistaViewModel?

    override func setUpWithError() throws {
        sut = IdealistaViewModelImpl(idealistaUseCase: useCaseMock)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_OnAppear_Success() async {
        
        await sut?.onAppear()
        
        XCTAssertEqual(sut?.loadState, .success(IdealistaModel.mocks))
        XCTAssertEqual(sut?.idealistaModel?.count, 5)
    }
    
    func testToggleLike() async {
        await sut?.onAppear()
        
        let flat = sut?.idealistaModel?.first
        XCTAssertFalse(flat?.isLiked ?? true)
        
        guard let flatToToggle = flat else { return }
        sut?.toggleLike(for: flatToToggle)
        
        XCTAssertTrue(sut?.idealistaModel?.first?.isLiked ?? false)
    }
}

struct IdealistaUseCaseMock: IdealistaUseCase {
    func execute() async throws -> [IdealistaModel] {
        return IdealistaModel.mocks
    }
}

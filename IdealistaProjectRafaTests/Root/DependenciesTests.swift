//
//  DependenciesTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

@MainActor
final class DependenciesTests: XCTestCase {

    func testCreateIdealistaViewController() {
        
        let viewController = Dependencies.createIdealistaViewController()
        XCTAssertTrue(viewController.viewModel is IdealistaViewModelImpl)
    }

    func testCreateIdealistaDetailView() {
        let detailView = Dependencies.createIdealistDetailView()
        XCTAssertTrue(detailView.viewModel is IdealistaDetailViewModelImpl)
    }

}

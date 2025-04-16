//
//  AppDelegateTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class AppDelegateTests: XCTestCase {

    var sut: AppDelegate!
    
    override func setUpWithError() throws {
        sut = AppDelegate()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDidFinishLaunching() {
        let result = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertTrue(result, "El método didFinishLaunchingWithOptions debería devolver true.")
    }

    func testDidDiscardSceneSessions() {
        let sceneSessions: Set<UISceneSession> = []
        sut.application(UIApplication.shared, didDiscardSceneSessions: sceneSessions)
        XCTAssertTrue(true, "El método didDiscardSceneSessions no debe generar errores.")
    }

}

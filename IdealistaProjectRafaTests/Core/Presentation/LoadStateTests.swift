//
//  LoadStateTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class LoadStateTests: XCTestCase {

    func testInitialStatesAreEqual() {
        XCTAssertEqual(LoadState.initial, LoadState.initial)
    }

    func testLoadingStatesAreEqual() {
        XCTAssertEqual(LoadState.loading, LoadState.loading)
    }
    
    func testFailureStatesWithSameErrorDomainAndCodeAreEqual() {
        let error1 = NSError(domain: "TestDomain", code: 404, userInfo: nil)
        let error2 = NSError(domain: "TestDomain", code: 404, userInfo: nil)
        
        XCTAssertEqual(LoadState.failure(error1), LoadState.failure(error2))
    }

    func testFailureStatesWithDifferentErrorCodesAreNotEqual() {
        let error1 = NSError(domain: "TestDomain", code: 404, userInfo: nil)
        let error2 = NSError(domain: "TestDomain", code: 500, userInfo: nil)
        
        XCTAssertNotEqual(LoadState.failure(error1), LoadState.failure(error2))
    }
    
    func testFailureStatesWithDifferentDomainsAreNotEqual() {
        let error1 = NSError(domain: "Domain1", code: 500, userInfo: nil)
        let error2 = NSError(domain: "Domain2", code: 500, userInfo: nil)
        
        XCTAssertNotEqual(LoadState.failure(error1), LoadState.failure(error2))
    }
    
    func testDifferentStatesAreNotEqual() {
        XCTAssertNotEqual(LoadState.initial, LoadState.loading)
        XCTAssertNotEqual(LoadState.loading, LoadState.success([]))
        XCTAssertNotEqual(LoadState.success([]), LoadState.failure(NSError(domain: "test", code: 1)))
    }

}

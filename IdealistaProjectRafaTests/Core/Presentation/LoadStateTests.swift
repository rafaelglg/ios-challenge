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
        XCTAssertEqual(LoadState<IdealistaModel>.initial, LoadState.initial)
    }

    func testLoadingStatesAreEqual() {
        XCTAssertEqual(LoadState<IdealistaModel>.loading, LoadState<IdealistaModel>.loading)
    }
    
    func testFailureStatesWithSameErrorDomainAndCodeAreEqual() {
        let error1 = NSError(domain: "TestDomain", code: 404, userInfo: nil)
        let error2 = NSError(domain: "TestDomain", code: 404, userInfo: nil)
        
        XCTAssertEqual(LoadState<IdealistaModel>.failure(error1), LoadState<IdealistaModel>.failure(error2))
    }

    func testFailureStatesWithDifferentErrorCodesAreNotEqual() {
        let error1 = NSError(domain: "TestDomain", code: 404, userInfo: nil)
        let error2 = NSError(domain: "TestDomain", code: 500, userInfo: nil)
        
        XCTAssertNotEqual(LoadState<IdealistaModel>.failure(error1), LoadState<IdealistaModel>.failure(error2))
    }
    
    func testFailureStatesWithDifferentDomainsAreNotEqual() {
        let error1 = NSError(domain: "Domain1", code: 500, userInfo: nil)
        let error2 = NSError(domain: "Domain2", code: 500, userInfo: nil)
        
        XCTAssertNotEqual(LoadState<IdealistaModel>.failure(error1), LoadState<IdealistaModel>.failure(error2))
    }
    
    func testDifferentStatesAreNotEqual() {
        XCTAssertNotEqual(LoadState<IdealistaModel>.initial, LoadState<IdealistaModel>.loading)
        XCTAssertNotEqual(LoadState<IdealistaModel>.loading, LoadState<IdealistaModel>.success(IdealistaModel.mock))
        XCTAssertNotEqual(LoadState<IdealistaModel>.success(IdealistaModel.mock), LoadState<IdealistaModel>.failure(NSError(domain: "test", code: 1)))
    }

}

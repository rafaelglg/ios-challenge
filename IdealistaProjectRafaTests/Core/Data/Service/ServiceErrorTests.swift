//
//  ServiceErrorTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class ServiceErrorTests: XCTestCase {
    
    func testErrorDescription_BadUrl() {
        let error: ServiceError = .badUrl
        XCTAssertEqual(error.errorDescription, "The url provided ir not valid")
    }
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

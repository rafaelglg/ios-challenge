//
//  DateExtensionTests.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class DateExtensionTests: XCTestCase {

    func testFormattedDate() {
         let date = Date(timeIntervalSince1970: 1622505600)
         let formattedDate = date.formattedDate()
         let expectedDate = "1 June 2021, 02:00:00"
         XCTAssertEqual(formattedDate, expectedDate)
     }
}

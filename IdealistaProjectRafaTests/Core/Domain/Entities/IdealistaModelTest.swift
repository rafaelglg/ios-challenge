//
//  IdealistaModelTest.swift
//  IdealistaProjectRafaTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaProjectRafa

final class IdealistaModelTest: XCTestCase {

    func testThumbnailUrl_Success() {
        let model = IdealistaModel.mock
        let expectedUrl = URL(string: model.thumbnail)
        XCTAssertEqual(model.thumbnailUrl, expectedUrl)
    }
    
    func testThumbnailUrl_Failed() {
        let model = IdealistaModel.empty
        let expectedUrl = URL(fileURLWithPath: "") 
        XCTAssertEqual(model.thumbnailUrl, expectedUrl)
    }
    
    func testMockIdealistaModel() {
        let mockModel = IdealistaModel.mock
        
        XCTAssertEqual(mockModel.propertyCode, "1")
        XCTAssertEqual(mockModel.price, 1195000)
        XCTAssertEqual(mockModel.address, "calle de Lagasca")
        XCTAssertEqual(mockModel.priceInfo.price.amount, 1195000)
    }
    
    func testSetIsLikedFalseClearsLikedDate() {
         var model = IdealistaModel.mock
         
         model.setIsLiked(to: true)
         model.setIsLiked(to: false)
         
         XCTAssertFalse(model.isLiked)
         XCTAssertNil(model.likedDate)
     }
}

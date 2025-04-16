//
//  IdealistaDetailModelTest.swift
//  IdealistaChallengeTests
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import XCTest
@testable import IdealistaChallenge

final class IdealistaDetailModelTest: XCTestCase {

    func testShowPrice() {
        let model = IdealistaDetail.mock
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
        formatter.locale = Locale(identifier: "es_ES")
        let formattedPrice = formatter.string(from: NSNumber(value: model.price)) ?? "\(model.price)"
        
        XCTAssertEqual(model.showPrice, formattedPrice)
    }
    
    func testIsExterior() {
        let modelExterior = MoreCharacteristicsDetail(
            communityCosts: 0,
            roomNumber: 0,
            bathNumber: 0,
            exterior: true,
            housingFurnitures: "",
            agencyIsABank: false,
            energyCertificationType: "",
            flatLocation: "",
            modificationDate: 0,
            constructedArea: 0,
            lift: false,
            boxroom: false,
            isDuplex: false,
            floor: "",
            status: ""
        )
        
        XCTAssertEqual(modelExterior.isExterior, "Is exterior")
        
        let modelNotExterior = MoreCharacteristicsDetail(
            communityCosts: 0,
            roomNumber: 0,
            bathNumber: 0,
            exterior: false,
            housingFurnitures: "",
            agencyIsABank: false,
            energyCertificationType: "",
            flatLocation: "",
            modificationDate: 0,
            constructedArea: 0,
            lift: false,
            boxroom: false,
            isDuplex: false,
            floor: "",
            status: ""
        )
        
        XCTAssertEqual(modelNotExterior.isExterior, "Is not exterior")
    }
    
    func testIsHasLift() {
        let modelExterior = MoreCharacteristicsDetail(
            communityCosts: 0,
            roomNumber: 0,
            bathNumber: 0,
            exterior: true,
            housingFurnitures: "",
            agencyIsABank: false,
            energyCertificationType: "",
            flatLocation: "",
            modificationDate: 0,
            constructedArea: 0,
            lift: true,
            boxroom: false,
            isDuplex: false,
            floor: "",
            status: ""
        )
        
        XCTAssertEqual(modelExterior.hasLift, "With lift")
        
        let modelNotExterior = MoreCharacteristicsDetail(
            communityCosts: 0,
            roomNumber: 0,
            bathNumber: 0,
            exterior: false,
            housingFurnitures: "",
            agencyIsABank: false,
            energyCertificationType: "",
            flatLocation: "",
            modificationDate: 0,
            constructedArea: 0,
            lift: false,
            boxroom: false,
            isDuplex: false,
            floor: "",
            status: ""
        )
        
        XCTAssertEqual(modelNotExterior.hasLift, "Without lift")
    }
    
    func testImageUrl_ValidURL() {
         let model = MultimediaImageDetail(url: "https://example.com/image.jpg", tag: "livingRoom", localizedName: "Salón", multimediaId: 123)
         
         let expectedUrl = URL(string: "https://example.com/image.jpg")
         XCTAssertEqual(model.imageUrl, expectedUrl)
     }

     func testImageUrl_InvalidURL() {
         let model = MultimediaImageDetail(url: "", tag: "livingRoom", localizedName: "Salón", multimediaId: 123)
         
         let expectedUrl = URL(filePath: "")
         XCTAssertEqual(model.imageUrl, expectedUrl)
     }
    
    func test_IsEmptyModel() {
        XCTAssertEqual(IdealistaDetail.empty.ubication, IdealistaDetail.empty.ubication)
    }

}

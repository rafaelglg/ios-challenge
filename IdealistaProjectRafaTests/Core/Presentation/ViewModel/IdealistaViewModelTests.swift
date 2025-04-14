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
        
        XCTAssertEqual(sut?.idealistaModel?.count, 5)
    }
    
    func test_OnAppear_ModelIsNotNil() async {
        sut?.idealistaModel = IdealistaModel.mocks
        await sut?.onAppear()
        
        XCTAssertNotNil(sut?.idealistaModel)
    }
    
    func test_OnAppear_Fails() async {
        let useCaseMock = IdealistaUseCaseMock(shouldFail: true)
        sut = IdealistaViewModelImpl(idealistaUseCase: useCaseMock)
        await sut?.onAppear()
        
        XCTAssertEqual(sut?.loadState, .failure(NSError(domain: "mock error", code: 1, userInfo: nil)))
    }
    
    func test_handleAdsFavorite_like_false() async throws {
        try await sut?.handleAdsFavorite(model: IdealistaModel.mock)
        XCTAssertFalse(IdealistaModel.mock.isLiked)
    }
    
    func test_handleAdsFavorite_Like_Is_True() async throws {
        
        try await sut?.handleAdsFavorite(model: useCaseMock.model)
        XCTAssertTrue(useCaseMock.model.isLiked)
    }
    
    func test_toggleLike_shouldToggle_IsLiked_True() async {
        guard var sut else { return }
        var model = IdealistaModel.mock
        model.isLiked = false
        sut.idealistaModel = [model]

        sut.toggleLike(for: model)
        guard let updatedModel = sut.idealistaModel?.first else {
            XCTFail("Model not found after toggling like")
            return
        }

        XCTAssertTrue(updatedModel.isLiked)
        XCTAssertNotNil(updatedModel.likedDate)
    }
    
    func test_toggleLike_Model_IsNil() async {
        sut?.idealistaModel = nil
        sut?.toggleLike(for: IdealistaModel.mock)
        XCTAssertNil(sut?.idealistaModel)
    }
    
    func test_toggleLike_setsLoadStateToFailure_onError() async {
        let flat = IdealistaModel.mock
        useCaseMock.shouldFail = true
        sut?.idealistaModel = [flat]
        sut?.toggleLike(for: flat)

        try? await Task.sleep(for: .seconds(0.5))
        if case .failure(let error) = sut?.loadState {
            XCTAssertNotNil(error)
        } else {
            XCTFail("Expected loadState to be .failure")
        }
    }
}

final class IdealistaUseCaseMock: IdealistaUseCase, @unchecked Sendable {
    
    var shouldFail: Bool
    var mockLiked: Bool = false
    // swiftlint:disable:next line_length
    let model = IdealistaModel(propertyCode: "", thumbnail: "", floor: "", price: 0, priceInfo: PriceInfo(price: Price(amount: 0, currencySuffix: "")), propertyType: "", operation: "", size: 0, exterior: false, rooms: 0, bathrooms: 0, address: "", province: "", municipality: "", district: "", country: "", neighborhood: "", latitude: 0.0, longitude: 0.0, description: "", multimedia: Multimedia(images: [ImageDetail(url: "", tag: "")]), features: Features(hasSwimmingPool: nil, hasTerrace: nil, hasAirConditioning: false, hasBoxRoom: false, hasGarden: nil), isLiked: true)
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }
    
    func executeAddFavorites(from model: IdealistaModel) async throws {
        if shouldFail {
            throw NSError(domain: "mock error", code: 1, userInfo: nil)
        } else {
            
        }
    }
    
    func executeGetFavoritesFromLocal() throws -> [IdealistaModel] {
        IdealistaModel.mocks
    }
    
    func removeFromFavorites(with id: String) throws { }
    
    func execute() async throws -> [IdealistaModel] {
        if shouldFail {
            throw NSError(domain: "mock error", code: 1, userInfo: nil)
        } else {
            IdealistaModel.mocks
        }
    }
}

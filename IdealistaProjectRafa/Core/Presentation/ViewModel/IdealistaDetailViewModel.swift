//
//  IdealistaDetailViewModel.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

@MainActor
protocol IdealistaDetailViewModel {
    var idealistaDetailModel: IdealistaDetail? { get }
    var task: Task<Void, Error>? { get set }
    var isLoading: Bool { get }
    
    func onAppear()
}

@MainActor
@Observable
final class IdealistaDetailViewModelImpl: IdealistaDetailViewModel {
    
    let detailUseCase: IdealistaDetailUseCase
    private(set) var idealistaDetailModel: IdealistaDetail?
    private(set) var isLoading: Bool = false
    
    var task: Task<Void, Error>?
    
    init(detailUseCase: IdealistaDetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func onAppear() {
        isLoading = true
        task = Task {
            defer {
                isLoading = false
            }
            
            do {
                idealistaDetailModel = try await detailUseCase.execute()
            } catch {
                print(error)
            }
        }
    }
}

@MainActor
@Observable
final class IdealistaDetailViewModelMock: IdealistaDetailViewModel {
    
    var isLiked: Bool = false
    var idealistaDetailModel: IdealistaDetail?
    var task: Task<Void, any Error>?
    var isLoading: Bool = false
    var mockModel: IdealistaDetail?
    
    var delay: Int
    
    init(delay: Int = 0, mockModel: IdealistaDetail? = .mock) {
        self.delay = delay
        self.mockModel = mockModel
    }
    
    func onAppear() {
        Task {
            try? await Task.sleep(for: .seconds(delay))
            idealistaDetailModel = mockModel
        }
    }
    
    func onLikePressed() {
        isLiked.toggle()
    }
}

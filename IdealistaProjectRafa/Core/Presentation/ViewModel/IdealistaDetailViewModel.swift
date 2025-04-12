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
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    
    func onAppear() async
}

@MainActor
@Observable
final class IdealistaDetailViewModelImpl: IdealistaDetailViewModel {
    
    let detailUseCase: IdealistaDetailUseCase
    private(set) var idealistaDetailModel: IdealistaDetail?
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String?
        
    init(detailUseCase: IdealistaDetailUseCase) {
        self.detailUseCase = detailUseCase
        isLoading = true
    }
    
    func onAppear() async {
        
        defer {
            isLoading = false
        }
        
        do {
            idealistaDetailModel = try await detailUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
            print(error)
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
    var errorMessage: String?
    
    var delay: Int
    
    init(delay: Int = 0, mockModel: IdealistaDetail? = .mock) {
        self.delay = delay
        self.mockModel = mockModel
    }
    
    func onAppear() async {
        isLoading = true
        Task {
            try? await Task.sleep(for: .seconds(delay))
            isLoading = false
            idealistaDetailModel = mockModel
        }
    }
    
    func onLikePressed() {
        isLiked.toggle()
    }
}

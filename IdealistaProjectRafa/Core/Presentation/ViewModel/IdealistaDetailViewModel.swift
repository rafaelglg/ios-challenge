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
    var loadState: LoadState<IdealistaDetail> { get }
    var errorMessage: String? { get }
    
    func onAppear() async
}

@MainActor
@Observable
final class IdealistaDetailViewModelImpl: IdealistaDetailViewModel {
    
    let detailUseCase: IdealistaDetailUseCase
    private(set) var idealistaDetailModel: IdealistaDetail?
    private(set) var loadState: LoadState<IdealistaDetail> = .initial
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String?
        
    init(detailUseCase: IdealistaDetailUseCase) {
        self.detailUseCase = detailUseCase
        isLoading = true
    }
    
    func onAppear() async {
        
        loadState = .loading
        do {
            let model = try await detailUseCase.execute()
            idealistaDetailModel = model
            loadState = .success(model)
        } catch {
            loadState = .failure(error)
            errorMessage = error.localizedDescription
            print(error)
        }
    }
}

@MainActor
@Observable
final class IdealistaDetailViewModelMock: IdealistaDetailViewModel {
    
    var loadState: LoadState<IdealistaDetail> = .initial
    var idealistaDetailModel: IdealistaDetail?
    var errorMessage: String?
    
    var delay: Int
    var mockModel: IdealistaDetail?
    
    init(delay: Int = 0,
         mockModel: IdealistaDetail? = .mock,
         loadState: LoadState<IdealistaDetail> = .initial
    ) {
        self.delay = delay
        self.mockModel = mockModel
        self.loadState = loadState
    }
    
    func onAppear() async {
        try? await Task.sleep(for: .seconds(delay))
        idealistaDetailModel = mockModel
        loadState = loadState
    }
}

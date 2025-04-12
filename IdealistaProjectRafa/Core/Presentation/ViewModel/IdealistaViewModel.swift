//
//  IdealistaViewModel.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

@MainActor
protocol IdealistaViewModel {
    
    var idealistaModel: [IdealistaModel]? { get }
    var alertMessage: String { get }
    var loadState: LoadState { get }

    func onAppear() async
    func toggleLike(for flat: IdealistaModel)
}

@MainActor
@Observable
final class IdealistaViewModelImpl: IdealistaViewModel {
    let idealistaUseCase: IdealistaUseCase
    private(set) var idealistaModel: [IdealistaModel]?
    private(set) var alertMessage: String = ""
    private(set) var loadState: LoadState = .initial
    
    init(idealistaUseCase: IdealistaUseCase) {
        self.idealistaUseCase = idealistaUseCase
    }
    
    func onAppear() async {
        guard idealistaModel == nil else { return }
        
        loadState = .loading
        do {
            let flats = try await idealistaUseCase.execute()
            self.idealistaModel = flats
            loadState = .success(flats)
        } catch {
            loadState = .failure(error)
        }
    }
    
    func toggleLike(for flat: IdealistaModel) {
        guard var model = idealistaModel,
              let index = model.firstIndex(of: flat) else {
            return
        }
        
        model[index].isLiked.toggle()
        model[index].likedDate = model[index].isLiked ? Date() : nil
        
        idealistaModel = model
    }
}

@MainActor
@Observable
final class IdealistaViewModelMock: IdealistaViewModel {
    
    var loadState: LoadState = .initial
    var alertMessage: String = ""
    var idealistaModel: [IdealistaModel]?
    var showModel: [IdealistaModel]?
    var delay: Int
    
    init(delay: Int = 0,
         loadState: LoadState = .initial,
         showModel: [IdealistaModel] = IdealistaModel.mocks) {
        self.delay = delay
        self.loadState = loadState
        self.showModel = showModel
    }
    
    func onAppear() async {
        try? await Task.sleep(for: .seconds(delay))
        idealistaModel = showModel
        loadState = loadState
    }
    
    func refreshable() async throws { }
    
    func toggleLike(for flat: IdealistaModel) {
        
    }
}

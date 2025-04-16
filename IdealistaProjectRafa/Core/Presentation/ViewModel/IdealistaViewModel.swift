//
//  IdealistaViewModel.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

@MainActor
protocol IdealistaViewModel {
    
    var idealistaModel: [IdealistaModel]? { get set }
    var alertMessage: String { get }
    var loadState: LoadState<[IdealistaModel]> { get }

    func onAppear() async
    func toggleLike(for flat: IdealistaModel)
    func handleAdsFavorite(model: IdealistaModel) async throws
}

@MainActor
@Observable
final class IdealistaViewModelImpl: IdealistaViewModel {
    let idealistaUseCase: IdealistaUseCase
    var idealistaModel: [IdealistaModel]?
    private(set) var alertMessage: String = ""
    private(set) var loadState: LoadState<[IdealistaModel]> = .initial
    
    init(idealistaUseCase: IdealistaUseCase) {
        self.idealistaUseCase = idealistaUseCase
    }
    
    func onAppear() async {
        guard idealistaModel == nil else { return }
        
        loadState = .loading
        do {
            let flats = try await idealistaUseCase.execute()
            let favorites = try idealistaUseCase.executeGetFavoritesFromLocal()

            let mergedFlats = mergeAds(flats: flats, markFavorite: favorites)

            self.idealistaModel = mergedFlats
            loadState = .success(mergedFlats)
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
        
        Task {
            do {
                let updatedFlat = model[index]
                try await handleAdsFavorite(model: updatedFlat)
            } catch {
                self.loadState = .failure(error)
            }
        }
    }
    
    func mergeAds(flats: [IdealistaModel], markFavorite: [IdealistaModel]) -> [IdealistaModel] {
        return flats.map { flat in
            var updated = flat
            if let favorite = markFavorite.first(where: { $0.propertyCode == flat.propertyCode }) {
                updated.isLiked = true
                updated.likedDate = favorite.likedDate
            }
            return updated
        }
    }
    
    func handleAdsFavorite(model: IdealistaModel) async throws {
        if model.isLiked {
            try await idealistaUseCase.executeAddFavorites(from: model)
        } else {
            try idealistaUseCase.removeFromFavorites(with: model.propertyCode )
        }
    }
}

@MainActor
@Observable
final class IdealistaViewModelMock: IdealistaViewModel {
    
    var loadState: LoadState<[IdealistaModel]> = .initial
    var alertMessage: String = ""
    var idealistaModel: [IdealistaModel]?
    var showModel: [IdealistaModel]?
    var delay: Int
    
    init(delay: Int = 0,
         loadState: LoadState<[IdealistaModel]> = .initial,
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
    func toggleLike(for flat: IdealistaModel) { }
    func handleAdsFavorite(model: IdealistaModel) async throws { }
}

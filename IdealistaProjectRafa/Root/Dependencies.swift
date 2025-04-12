//
//  Dependencies.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

@MainActor
struct Dependencies {
    
    static func createIdealistaViewController() -> IdealistaViewController {
        let service = IdealistaServiceImpl()
        let repository = IdealistaRepositoryImpl(service: service)
        let useCase = IdealistaUseCaseImpl(repository: repository)
        let viewModel = IdealistaViewModelImpl(idealistaUseCase: useCase)
        return IdealistaViewController(viewModel: viewModel)
    }
    
    static func createIdealistDetailView() -> IdealistaDetailView {
        let service = IdealistaServiceImpl()
        let repository = IdealistaDetailRepositoryImpl(service: service)
        let useCase = IdealistaDetailUseCaseImpl(repository: repository)
        let viewModel = IdealistaDetailViewModelImpl(detailUseCase: useCase)
        return IdealistaDetailView(viewModel: viewModel)
    }
}

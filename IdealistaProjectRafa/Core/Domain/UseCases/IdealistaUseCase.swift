//
//  IdealistaUseCase.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaUseCase: Sendable {
    func execute() async throws -> [IdealistaModel]
}

struct IdealistaUseCaseImpl: IdealistaUseCase {
    
    let repository: IdealistaRepository
    
    init(repository: IdealistaRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [IdealistaModel] {
        try await repository.fetchIdealistaInfo()
    }
}

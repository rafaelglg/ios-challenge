//
//  IdealistaDetailUseCase.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaDetailUseCase: Sendable {
    func execute() async throws -> IdealistaDetail
}

struct IdealistaDetailUseCaseImpl: IdealistaDetailUseCase {
    let repository: IdealistaDetailRepository
    
    init(repository: IdealistaDetailRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> IdealistaDetail {
        try await repository.fetchDetailInfo()
    }
}

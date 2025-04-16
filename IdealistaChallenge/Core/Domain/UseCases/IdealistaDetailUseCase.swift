//
//  IdealistaDetailUseCase.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaDetailUseCase: Sendable {
    func execute() async throws -> IdealistaDetail
}

struct IdealistaDetailUseCaseImpl: IdealistaDetailUseCase {
    let repository: IdealistaDetailRepository
    
    func execute() async throws -> IdealistaDetail {
        try await repository.fetchDetailInfo()
    }
}

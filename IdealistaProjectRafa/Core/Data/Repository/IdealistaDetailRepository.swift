//
//  IdealistaDetailRepository.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaDetailRepository: Sendable {
    func fetchDetailInfo() async throws -> IdealistaDetail
}

struct IdealistaDetailRepositoryImpl: IdealistaDetailRepository {
    let service: IdealistaService
    
    func fetchDetailInfo() async throws -> IdealistaDetail {
        try await service.fetchIdelistaDetail()
    }
}

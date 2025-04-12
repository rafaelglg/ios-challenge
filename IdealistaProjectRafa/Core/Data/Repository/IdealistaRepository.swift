//
//  IdealistaRepository.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

protocol IdealistaRepository: Sendable {
    func fetchIdealistaInfo() async throws -> [IdealistaModel]
}

struct IdealistaRepositoryImpl: IdealistaRepository {
    let service: IdealistaService
    
    init(service: IdealistaService) {
        self.service = service
    }
    
    func fetchIdealistaInfo() async throws -> [IdealistaModel] {
        try await service.fetchIdelistaData()
    }
}

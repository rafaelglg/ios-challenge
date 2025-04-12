//
//  IdealistaService.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

protocol IdealistaService: Sendable {
    func fetchIdelistaData() async throws -> [IdealistaModel]
    func fetchIdelistaDetail() async throws -> IdealistaDetail
}

struct IdealistaServiceImpl: IdealistaService {
    
    func fetchIdelistaData() async throws -> [IdealistaModel] {
        
        guard let url = URL(string: Constants.idealistaUrlString) else {
            throw ServiceError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([IdealistaModel].self, from: data)
    }
    
    func fetchIdelistaDetail() async throws -> IdealistaDetail {
        
        guard let url = URL(string: Constants.idealistaDetailUrlString) else {
            throw ServiceError.badUrl
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(IdealistaDetail.self, from: data)
    }
}

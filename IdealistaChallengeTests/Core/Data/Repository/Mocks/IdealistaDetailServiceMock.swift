//
//  IdealistaDetailServiceMock.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 12/4/25.
//

@testable import IdealistaChallenge

struct IdealistaDetailServiceMock: IdealistaService {
    func fetchIdelistaData() async throws -> [IdealistaModel] {
        IdealistaModel.mocks
    }
    
    func fetchIdelistaDetail() async throws -> IdealistaDetail {
        IdealistaDetail.mock
    }
}

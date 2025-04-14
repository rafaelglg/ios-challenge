//
//  LocalPersistance.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 13/4/25.
//

import Foundation
import SwiftData

@MainActor
protocol IdealistaPersistance: Sendable {
    func addFavorite(from model: IdealistaModel) throws
    func getFavorites() throws -> [IdealistaModel]
    func removeFromFavorites(with id: String) throws
}

@MainActor
struct LocalPersistanceImpl: IdealistaPersistance {
    
    let container: ModelContainer
    var context: ModelContext {
        container.mainContext
    }
    
    // swiftlint:disable:next force_try
    init(container: ModelContainer = try! ModelContainer(for: IdealistaEntity.self)) {
        self.container = container
    }
    
    func addFavorite(from model: IdealistaModel) throws {
        let entity = IdealistaEntity(from: model)
        context.insert(entity)
        try context.save()
    }
    
    func getFavorites() throws -> [IdealistaModel] {
        let descriptor = FetchDescriptor<IdealistaEntity>( sortBy: [SortDescriptor(\IdealistaEntity.dateLiked, order: .reverse)]
        )
        let entities = try context.fetch(descriptor)
        return entities.map {$0.toIdealistaModel}
    }
    
    func removeFromFavorites(with id: String) throws {
        let descriptor = FetchDescriptor<IdealistaEntity>(predicate: #Predicate {$0.id == id})
        let result = try context.fetch(descriptor)
        result.forEach { context.delete($0) }
        try context.save()
    }
}

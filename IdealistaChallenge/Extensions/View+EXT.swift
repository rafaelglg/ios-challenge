//
//  Extension+View.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import SwiftUI

extension View {
    func removeListRowFormatting() -> AnyView {
        self
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowBackground(Color.clear)
            .toAnyView()
    }
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}

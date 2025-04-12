//
//  IdealistaDetailView.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import SwiftUI

struct IdealistaDetailView: View {
    
    @State var viewModel: IdealistaDetailViewModel
    
    var body: some View {
        List {
            
            if viewModel.isLoading {
                placeholder
            } else if let model = viewModel.idealistaDetailModel {
                IdealistaDetailRow(detailModel: model)
            } else {
                errorView
            }
            
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.onAppear)
    }
    
    var placeholder: some View {
        IdealistaDetailRow(detailModel: .mock)
            .redacted(reason: .placeholder)
    }
    
    var errorView: some View {
        ContentUnavailableView("No ads found", systemImage: "house.fill", description: Text("Come again later."))
            .removeListRowFormatting()
    }
}

#Preview("With mock") {
    let viewModel = IdealistaDetailViewModelMock()
    return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
    }
}

#Preview("With placeHolder") {
    let viewModel = IdealistaDetailViewModelMock()
    viewModel.isLoading = true
    return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
    }
}

#Preview("Error view") {
    let viewModel = IdealistaDetailViewModelMock(mockModel: nil)
    return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
        
    }
}

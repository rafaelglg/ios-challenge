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
            switch viewModel.loadState {
            case .initial, .loading:
                placeholder
            case .success(let model):
                IdealistaDetailRow(detailModel: model)
            case .failure:
                errorView
            }
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.onAppear()
        }
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
    viewModel.loadState = .success(IdealistaDetail.mock)
    return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
    }
}

#Preview("Slow loading") {
    @Previewable @State var viewModel = IdealistaDetailViewModelMock(mockModel: .mock)
    @Previewable @State var loadState = LoadState<IdealistaDetail>.initial
    Task {
        try? await Task.sleep(for: .seconds(3))
        loadState = .success(IdealistaDetail.mock)
    }
    viewModel.loadState = loadState
     return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
    }
}

#Preview("With placeHolder") {
    @Previewable @State var viewModel = IdealistaDetailViewModelMock(loadState: .loading)
    viewModel.loadState = .loading
    return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
    }
}

#Preview("Error view") {
    @Previewable @State var viewModel = IdealistaDetailViewModelMock(
        mockModel: nil,
        loadState: .failure(URLError(.badURL))
    )
     return NavigationStack {
        IdealistaDetailView(
            viewModel: viewModel
        )
    }
}

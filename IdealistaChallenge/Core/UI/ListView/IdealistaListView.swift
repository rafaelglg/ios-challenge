//
//  IdealistaListView.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import SwiftUI

struct IdealistaListView: View {
    
    @State var viewModel: IdealistaViewModel
    
    var body: some View {
        NavigationStack {
            List {
                
                switch viewModel.loadState {
                case .initial, .loading:
                    placeHolderRow
                case .success(let flats):
                    showScreen(flats)
                case .failure:
                    loadErrorScreen
                }
            }
            .clipped()
            .refreshable {
                await viewModel.refreshable()
            }
            .navigationDestination(for: IdealistaModel.self) { _ in
                Dependencies.createIdealistDetailView()
            }
            .task {
                await viewModel.onAppear()
            }
        }
    }
    
    @ViewBuilder
    var placeHolderRow: some View {
        ForEach(IdealistaModel.mocks, id: \.self) { flat in
            IdealistaRowView(flat: flat)
                .redacted(reason: .placeholder)
        }
    }
    
    @ViewBuilder
    func showScreen(_ flats: [IdealistaModel]) -> some View {
        if flats.isEmpty {
            loadErrorScreen
        } else {
            ForEach(viewModel.idealistaModel ?? [], id: \.propertyCode) { flat in
                NavigationLink(value: flat) {
                    IdealistaRowView(flat: flat) {
                        viewModel.toggleLike(for: flat)
                    }
                }
            }
        }
    }

    var loadErrorScreen: some View {
        ContentUnavailableView("No info found", systemImage: "house.slash.fill", description: Text("Try again later."))
            .removeListRowFormatting()
    }
}

#Preview("Mock") {
    let viewModel = IdealistaViewModelMock(loadState: .success(IdealistaModel.mocks))
    return IdealistaListView(viewModel: viewModel)
        .task {
            await viewModel.onAppear()
        }
}

#Preview("Loading") {
    let viewModel = IdealistaViewModelMock(loadState: .loading)
    return IdealistaListView(viewModel: viewModel)
}

#Preview("Error view") {
    let viewModel = IdealistaViewModelMock(loadState: .failure(URLError(.badURL)))
      IdealistaListView(viewModel: viewModel)
}

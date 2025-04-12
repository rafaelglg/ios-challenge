//
//  IdealistaRowView.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import SwiftUI

struct IdealistaRowView: View {
    
    var flat: IdealistaModel
    var onLikeToggle: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            pictureSection
            addressSection
            price
            flatFeatures
            likedButton
        }
    }
    
    var pictureSection: some View {
        AsyncImage(url: flat.thumbnailUrl) { image in
            image.resizable()
                .frame(maxWidth: .infinity)
                .clipShape(.rect(cornerRadius: 15))
                .scaledToFit()
        } placeholder: {
            Rectangle()
                .frame(maxWidth: .infinity)
                .shimmerEffect()
                .clipShape(.rect(cornerRadius: 15))
                .scaledToFit()
        }
        .padding()
    }
    
    var addressSection: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(flat.address.capitalized)
                .bold()
                .font(.title2)
            HStack {
                Text(flat.district + ", " + flat.province)
                    .font(.body)
            }
        }
    }
    
    var price: some View {
        Text(flat.price.description + flat.priceInfo.price.currencySuffix)
    }
    
    @ViewBuilder
    var flatFeatures: some View {
        HStack(spacing: 15) {
            Text(flat.rooms.description + " hab.")
            Text(flat.size.description + " m²")
            Text("planta " + flat.floor.description)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    @ViewBuilder
    var likedButton: some View {
        if flat.isLiked {
            Menu {
                Button {
                    onLikeToggle?()
                } label: {
                    Text("delete from favorites")
                    Image(systemName: "heart.slash")
                }
            } label: {
                Image(systemName: flat.isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(flat.isLiked ? .red : .secondary)
            }
            .frame(width: 45, height: 45)
        } else {
            Button {
                onLikeToggle?()
            } label: {
                Image(systemName: flat.isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(flat.isLiked ? .red : .secondary)
            }
            .buttonStyle(.plain)
            .frame(width: 45, height: 45)
        }
        likedDateInfo
    }
    
    var likedDateInfo: some View {
        ZStack {
            if let date = flat.likedDate, flat.isLiked {
                Text("Saved \(date.formattedDate())")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .frame(height: 20)
        .animation(.easeInOut, value: flat.isLiked)
    }
}

#Preview("With action") {
    @Previewable @State var isLiked: Bool = false

    List {
        IdealistaRowView(flat: .mock) {
            isLiked.toggle()
        }
    }
}

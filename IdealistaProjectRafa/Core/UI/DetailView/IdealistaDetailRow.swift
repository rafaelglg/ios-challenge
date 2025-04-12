//
//  IdealistaDetailRow.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import SwiftUI

struct IdealistaDetailRow: View {
    
    var detailModel: IdealistaDetail
    @State var lineLimitComment: Int? = 2
    
    var body: some View {
        pictureSection
        VStack(alignment: .leading) {
            price
            flatFeatures
        }
        mapSection
    }
    
    @ViewBuilder
    var pictureSection: some View {
        let images = detailModel.multimedia.images
        if !images.allSatisfy({$0.url.isEmpty}) {
            TabView {
                ForEach(detailModel.multimedia.images, id: \.multimediaId) { image in
                    AsyncImage(url: image.imageUrl) { image in
                        image
                            .resizable()
                            .frame(height: 250)
                            .frame(maxWidth: .infinity)
                            .clipShape(.rect(cornerRadius: 15))
                            .padding()
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 250)
                            .shimmerEffect()
                            .clipShape(.rect(cornerRadius: 15))
                    }
                }
            }
            .removeListRowFormatting()
            .tabViewStyle(.page)
            .frame(height: 260)
            .padding(.bottom, 20)
        }
    }
    
    var price: some View {
        HStack {
            Text("**Price**:")
            Text(detailModel.showPrice)
                .font(.title3)
        }
        .padding(.top)
    }
    
    @ViewBuilder
    var flatFeatures: some View {
        if !detailModel.propertyComment.isEmpty {
            Text("Advertiser's comment")
                .font(.title3)
                .bold()
                .lineLimit(1)
                .padding(.vertical)
            
            HStack {
                Text(detailModel.propertyComment)
                    .font(.callout)
                    .lineLimit(lineLimitComment)
            }
            onPressedMoreButton
        }
        basicInformation
        buildingInformation
        EnergyInformation
    }
    
    var onPressedMoreButton: some View {
        Button {
            onPressedSeeMore()
        } label: {
            Text(lineLimitComment == nil ? "See less" : "See more")
                .foregroundStyle(.link)
                .font(.caption)
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    var basicInformation: some View {
        Text("Basic information")
            .font(.title3)
            .bold()
            .lineLimit(1)
            .padding(.top)
        HStack {
            Text("Constructed Area:")
            Text(detailModel.moreCharacteristics.constructedArea.description + " m²")
        }
        Text(detailModel.moreCharacteristics.roomNumber.description + " rooms")
        Text(detailModel.moreCharacteristics.bathNumber.description + " bathrooms")
        Text(detailModel.moreCharacteristics.isExterior)
    }
    
    @ViewBuilder
    var buildingInformation: some View {
        Text("Building information")
            .font(.title3)
            .bold()
            .lineLimit(1)
            .padding(.top)
        Text( "🛗 " + detailModel.moreCharacteristics.hasLift)
    }
    
    @ViewBuilder
    var EnergyInformation: some View {
        if !detailModel.energyCertification.title.isEmpty {
            Text("Energy Performance Certificate (EPC)")
                .font(.title3)
                .bold()
                .padding(.top)
            Text(detailModel.energyCertification.title + ": " + detailModel.energyCertification.emissions.type)
                .padding(.bottom)
        }
    }
    
    @ViewBuilder
    var mapSection: some View {
        if detailModel.ubication.latitude != 0.0 && detailModel.ubication.longitude != 0.0 {
            Section {
                MapView(locationName: detailModel.propertyType, latituted: detailModel.ubication.latitude, longitude: detailModel.ubication.longitude)
                    .frame(height: 400)
                    .removeListRowFormatting()
            } header: {
                Text("Map")
            }
        }
    }
    
    func onPressedSeeMore() {
        lineLimitComment = (lineLimitComment == 2) ? nil : 2
    }
}

#Preview("Mock") {
    List {
        IdealistaDetailRow(detailModel: .empty)
    }
}

#Preview("Empty mock") {
    List {
        IdealistaDetailRow(detailModel: .empty)
    }
}


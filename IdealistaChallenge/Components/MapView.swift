//
//  MapView.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 12/4/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var locationName: String?
    var latituted: Double?
    var longitude: Double?
    @State var cameraPosition: MapCameraPosition = .automatic
    @State private var selectedResult: Int?
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latituted ?? 0,
            longitude: longitude ?? 0
        )
    }
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedResult) {
            
            Marker(locationName ?? "", systemImage: "house", coordinate: coordinate)
                .tag(1)
        }
        .onAppear(perform: onAppear)
        .mapControls {
            MapScaleView()
            MapCompass()
            MapPitchToggle()
                .mapControlVisibility(.visible)
        }
        .mapStyle(.standard(elevation: .realistic))
    }
    
    func onAppear() {
        let locationSpan = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0)
        let region = MKCoordinateRegion(center: coordinate, span: locationSpan)
        self.cameraPosition = .region(region)
    }
}

#Preview {
    List {
        MapView(
            locationName: "Idealista",
            latituted: 40.4362687,
            longitude: -3.6833686
        )
        .frame(height: 400)
        .removeListRowFormatting()
    }
}

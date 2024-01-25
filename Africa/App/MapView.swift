//
//  MapView.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import SwiftUI
import MapKit

struct MapView: View {

    // MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        let mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286,
                                                    longitude: 16.4377599)
        let mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0,
                                            longitudeDelta: 70.0)
        return MKCoordinateRegion(center: mapCoordinates,
                                  span: mapZoomLevel)
    }()

    let locations: [NationParkLocation] = decode(.locations)

    // MARK: - Body
    var body: some View {
        // MARK: - 1. Basic map
//        Map(coordinateRegion: $region)

        // MARK: - 2. Advanced map
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            // (A) PIN: OLD STYLE (always static) // Deprecated
//            MapPin(coordinate: location.location, tint: .accentColor)

            // (B) MARKER: NEW STYLE (always static)
//            MapMarker(coordinate: location.location, tint: .accentColor)

            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: location.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32,
//                           height: 32,
//                           alignment: .center)
//            } //: MapAnnotation

            // (D) CUSTOM ADVANCED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: location.location) {
                MapAnnotationView(location: location)
            } //: MapAnnotation
        } //: Map
        .overlay(
            HStack(spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,
                           height: 48,
                       alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitud:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HStack
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HStack
                } //: VStack
            } //: HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                ) //: HStack background
                .padding()
            , alignment: .top
        ) //: Map overlay
    }
}

// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

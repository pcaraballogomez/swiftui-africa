//
//  LocationModel.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import Foundation
import MapKit

struct NationParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude,
                               longitude: longitude)
    }
}

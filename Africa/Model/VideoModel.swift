//
//  VideoModel.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import Foundation

struct Video: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        "video-\(id)"
    }
}

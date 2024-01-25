//
//  FileHelper.swift
//  Africa
//
//  Created by Pablo Caraballo Gómez on 24/1/24.
//

import Foundation

enum File: String {
    case animals = "animals.json"
    case covers = "covers.json"
    case locations = "locations.json"
    case videos = "videos.json"
}

func decode<T: Codable>(_ file: File) -> T {
    Bundle.main.decode(file.rawValue)
}

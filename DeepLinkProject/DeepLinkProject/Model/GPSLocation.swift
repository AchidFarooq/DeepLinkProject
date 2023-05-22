//
//  GPSLocation.swift
//  DeepLinkProject
//
//  Created by Achid Farooq on 21/05/2023.
//

import Foundation

public struct Coordinates: Decodable {
    let locations: [GPSLocation]

    init(locations: [GPSLocation]) {
        self.locations = locations
    }
}

public struct GPSLocation: Decodable, Hashable {
    let name: String?
    let lat: Double
    let long: Double
    
    public init(name: String?, lat: Double, long: Double) {
        self.name = name
        self.lat = lat
        self.long = long
    }
}

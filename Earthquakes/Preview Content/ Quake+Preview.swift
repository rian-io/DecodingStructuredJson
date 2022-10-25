//
//   Quake+Preview.swift
//  Earthquakes-iOS
//
//  Created by Rian de Oliveira on 24/10/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation

extension Quake {
    static var preview: Quake {
        var quake = Quake(magnitude: 0.34,
                          place: "Shakey Acres",
                          time: Date(timeIntervalSinceNow: -1000),
                          code: "nc73649170",
                          detail: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson")!,
                          tsunami: 0)
        quake.location = QuakeLocation(latitude: 38.809_333_8, longitude: -122.796_836_9)
        return quake
    }
}

//
//  QuakeDetail.swift
//  Earthquakes-iOS
//
//  Created by Rian de Oliveira on 24/10/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import SwiftUI

struct QuakeDetail: View {
    var quake: Quake
    @EnvironmentObject private var quakesProvider: QuakesProvider
    @State private var location: QuakeLocation? = nil
    @State private var precision = 3
    
    var body: some View {
        VStack {
            if let location = self.location {
                QuakeDetailMap(location: location, tintColor: quake.color)
                    .ignoresSafeArea(.container)
            }
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted(date: .long, time: .shortened))")
                .foregroundStyle(Color.secondary)
            if let location = self.location {
                Group {
                    Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(precision))))")
                    Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(precision))))")
                }.onTapGesture {
                    precision = precision == 3 ? 7 : 3
                }
            }
        }
        .task {
            if self.location == nil {
                if let quakeLocation = quake.location {
                    self.location = quakeLocation
                } else {
                    self.location = try? await quakesProvider.location(for: quake)
                }
            }
        }
    }
}

struct QuakeDetail_Previews: PreviewProvider {
    static var previews: some View {
        QuakeDetail(quake: Quake.preview)
    }
}

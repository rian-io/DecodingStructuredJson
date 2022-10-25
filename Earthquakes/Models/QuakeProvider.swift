//
//  QuakeProvider.swift
//  Earthquakes-iOS
//
//  Created by Rian de Oliveira on 23/10/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {
    
    @Published var quakes: [Quake] = []
    
    let client: QuakeClient
    
    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }
    
    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
    
    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }
    
    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}

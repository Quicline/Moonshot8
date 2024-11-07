//
//  ContentView.swift
//  Moonshot8
//
//  Created by Armando Francisco on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        
        Text(String(astronauts.count))
        Text(String(missions.count))
        
    }
}

#Preview {
    ContentView()
}

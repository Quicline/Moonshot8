//
//  ContentView.swift
//  Moonshot8
//
//  Created by Armando Francisco on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        
        Text(String(astronauts.count))
        
    }
}

#Preview {
    ContentView()
}

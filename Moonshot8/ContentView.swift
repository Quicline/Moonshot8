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
    
    @State var showinGrid: Bool = false
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack {
            Group {
                if showinGrid {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label: {
                                    VStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                            
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(.lightBackground)
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    }
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                    
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
                } else {
                    List {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                HStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                    .padding(.horizontal)
                                    .frame(maxHeight: .infinity)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.darkBackground)
                    }
                    .listStyle(.plain)
                    .background(.darkBackground)
                    .preferredColorScheme(.dark)
                    
                }
            }
            .toolbar {
                Button( showinGrid ? "Show List" : "Show Grid") {
                    showinGrid.toggle()
                }
//                Toggle("Show List",isOn: $showinGrid)
//                    .toggleStyle(SwitchToggleStyle(tint: .blue.opacity(0.7)))
            }
            .navigationTitle("Moonshot Missions")
        }
    }
}

#Preview {
    ContentView()
}

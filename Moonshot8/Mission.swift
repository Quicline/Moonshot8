//
//  Mission.swift
//  Moonshot8
//
//  Created by Armando Francisco on 11/7/24.
//

import Foundation

struct Mission: Codable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}

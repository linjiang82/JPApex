//
//  ApexPredator.swift
//  JPApex
//
//  Created by Jiang Lin on 26/10/2023.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable{
    let id:Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        switch type {
        case "land":
            return .brown
        case "air":
            return .teal
        case "sea":
            return .blue
        default:
            return .white
        }
    }
}

struct MovieScene: Codable, Identifiable{
    let id:Int
    let movie: String
    let sceneDescription: String
}

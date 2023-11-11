//
//  PredatorController.swift
//  JPApex
//
//  Created by Jiang Lin on 26/10/2023.
//

import Foundation

class PredatorController {
    
    var allApexPredattors: [ApexPredator] = []
    var apexPredattors: [ApexPredator] = []
    
    let filterType: [String] = ["ALL", "Land", "Sea", "Air"]
    let movieName: [String] = ["ALL", "Jurassic Park",
                                "The Lost World: Jurassic Park",
                                "Jurassic Park III",
                                "Jurassic World",
                                "Jurassic World: Fallen Kingdom"]
    
    init(){
        decodeApexPredatorData()
    }
    
    func filterIcon(for type: String) -> String {
        switch type {
        case "Land":
            return "leaf.fill"
        case "Air":
            return "wind"
        case "Sea":
            return "drop.fill"
        case "All":
            return "square.stack.3d.up.fill"
        default:
            return "questionmark"
        }
    }
    func filterBy(type: String) {
        switch type {
        case "Land", "Air", "Sea":
            apexPredattors = allApexPredattors.filter {
                $0.type == type.lowercased()
            }
        default:
            apexPredattors = allApexPredattors
        }
    }
    
    func filterBy(movieName: String) {
        switch movieName {
        case "Jurassic Park", "The Lost World: Jurassic Park", "Jurassic Park III", "Jurassic World", "Jurassic World: Fallen Kingdom":
            apexPredattors = allApexPredattors.filter {
                $0.movies.contains(movieName)
            }
        default:
            apexPredattors = allApexPredattors
        }
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredattors = try decoder.decode([ApexPredator].self, from: data)
                apexPredattors = allApexPredattors
            }
            catch{
                print("Error decoding JSON data: \(error)")
            }
        }
            
    }
    
    func sortByAlphabatical() {
        apexPredattors.sort(by: { $0.name < $1.name } )
    }
    
    func sortByMovie() {
        apexPredattors.sort(by: { $0.id < $1.id })
    }
}

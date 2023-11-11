//
//  ContentView.swift
//  JPApex
//
//  Created by Jiang Lin on 26/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let  apController = PredatorController()
    @State var sortByAlphabatical = false
    @State var filterType = "All"
    @State var movieName = "All"
    
    var body: some View {
        
        apController.filterBy(type: filterType)
        apController.filterBy(movieName: movieName)
        
        if sortByAlphabatical {
            apController.sortByAlphabatical()
        }
        else {
            apController.sortByMovie()
        }
        
        return NavigationView {
            List {
                ForEach(apController.apexPredattors){ predator in
                    NavigationLink(destination: PredatorDetail(predator: predator)){
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        withAnimation{
                            sortByAlphabatical.toggle()
                        }
                    } label: {
                        if sortByAlphabatical {
                            Image(systemName: "film")
                        }
                        else {
                            Image(systemName: "textformat")
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Menu {
                        Picker("Filter", selection: $movieName.animation()){
                            ForEach(apController.movieName, id: \.self){ movieName in
                                HStack{
                                    Text(movieName)
                                    Spacer()
//                                    Image(systemName: apController.filterIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "film")
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Menu {
                        Picker("Filter", selection: $filterType.animation()){
                            ForEach(apController.filterType, id: \.self){ type in
                                HStack{
                                    Text(type)
                                    Spacer()
                                    Image(systemName: apController.filterIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

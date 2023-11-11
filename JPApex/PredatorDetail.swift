//
//  PredatorDetail.swift
//  JPApex
//
//  Created by Jiang Lin on 26/10/2023.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        ScrollView{
            VStack(alignment: .trailing, content: {
                    Image(predator.type)
                        .resizable()
                        .scaledToFit()
                NavigationLink(destination: Image(predator.name.lowercased().replacingOccurrences(of: " ", with: "")).resizable().scaledToFit().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)){
                    Image(predator.name.lowercased().replacingOccurrences(of: " ", with: ""))
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                        .shadow(color: .black, radius:6, x:0, y: 0)
                        .rotation3DEffect(
                            .degrees(180), axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                        )
                }
                        .offset(y: -210)
                VStack(alignment: .leading, content: {
                    Text(predator.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    
                    Text("Appears In:")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• " + movie)
                            .font(.subheadline)
                    }
                    
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes){scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding([.top, .bottom], 1)
                        
                        Text(scene.sceneDescription)
                            .font(.subheadline)
                            .padding(.bottom, 15)
                    }
                    Link("Read More", destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }).padding(.top, -230)
                    .padding()
                
            })
            .ignoresSafeArea()
            
        }
    }
}

#Preview {
    PredatorDetail(predator: ApexPredator(id: 1,
                                          name: "Brachiosaurus",
                                          type: "land",
                                          movies: [
                                              "Jurassic Park",
                                              "Jurassic Park III",
                                              "Jurassic World: Fallen Kingdom"
                                          ],
                                          movieScenes: [
                                              MovieScene(
                                                  id: 1,
                                                  movie: "Jurassic Park",
                                                  sceneDescription: "The Brachiosaurus was the first dinosaur encountered by the endorsement team hired by InGen to make sure Jurassic Park was safe for visitors. The entire team was amazed. Dr. Alan Grant and Dr. Ellie Sattler were the most awestruck of the group because the Brachiosaurus was terrestrial, not semi-aquatic swamp dwellers they had thought they were.\n\nWhen Dennis Nedry disabled Jurassic Park's security systems, the security fences that kept the prehistoric animals from escaping their enclosures were disabled as well, Brachiosaurus was one of the dinosaurs that were able to roam freely.\n\nAfter fleeing from the Tyrannosaur Paddock, Dr. Alan Grant and Tim and Lex Murphy climbed a tree where saw a herd of Brachiosaurus feeding on the nearby trees, hooting in the distance. Dr. Alan Grant heard their calls and attempted to imitate them to successful results. The following morning, a Brachiosaurus sick with a cold or a similar disease fed on the tree that the three humans were sleeping in, waking them up. Lex panicked at the sight of the dinosaur, believing it to be dangerous at first, but she soon calmed down when Dr. Alan Grant and her brother showed her that it was harmless. Dr. Grant fed the Brachiosaurus a nearby branch on the tree and Tim Murphy even pet it. However, when Lex attempted to pet the dinosaur like her brother did, the Brachiosaurus responded by sneezing on her. The humans and the Brachiosaurus later went their separate ways.\n\nIt is unknown what happened to the Brachiosaur populations on Isla Nublar after the Isla Nublar Incident of 1993.\n\nHowever, according to information revealed by InGen reports, there were at least 5 surviving Brachiosaurus on the island by October 1994. One died due to malnutrition."
                                              ),
                                              MovieScene(
                                                  id: 2,
                                                  movie: "Jurassic Park III",
                                                  sceneDescription: "Passengers of the plane N622DC saw a herd of Brachiosaurus during their fly-over of Isla Sorna at the beginning of the Isla Sorna Incident of 2001.\n\nAnother herd was seen by Dr. Alan Grant and the Kirby family at a river bank."
                                              ),
                                              MovieScene(
                                                  id: 3,
                                                  movie: "Jurassic World: Fallen Kingdom",
                                                  sceneDescription: "It is revealed that there are some surviving Brachiosaurus populations on Isla Nublar, but the species faces danger in the form of an impending erupting volcano.\n\nA Brachiosaurus is later seen walking down the ruins of Main Street, in front of Owen, Claire, Zia and others.\n\nA Brachiosaurus skeleton was seen near the radio tower's hatch.\n\nWhen Mt. Sibo erupts, the Brachiosaurs were among the dinosaurs stampeding from the eruption, facing many heavy casualties, most notably: as the boat Arcadia leaves Nublar to its fate, a Brachiosaurus, the same one seen by Grant and Sattler 25 years ago, is seen walking down the East Dock, crying out and standing on its hind legs as it is slowly engulfed by the toxic smoke and debris from the erupting volcano, letting out its final cries.\n\nDespite the massive casualties, the species' survival is confirmed by the Arcadia's manifest, and by J.A. Bayona himself, which shows that at least two adult Brachiosaurus had been captured and escaped the estate off-screen.\n\nSome of Mill's mercenaries managed to salvage its viable embryo, as seen during Malcolm's voiced over final testimony with the committee, implying that more Brachiosaurus may be engineered in the future."
                                              )
                                            
                                          ],
                                          link: "https://jurassicpark.fandom.com/wiki/Brachiosaurus" ))
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .previewLayout(.sizeThatFits)
}

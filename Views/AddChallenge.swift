//
//  AddChallenge.swift
//  MySports
//
//  Created by yvan pussard on 30/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI



struct AddChallenge: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var addChallenge : String = ""
    @Binding var isAdded: Bool
    let width = UIScreen.main.bounds.width
    
    var availableChallenge : [Challenge] = [
        Challenge(name: "1000 pompes dans la semaine", image: "ChallPop1"),
        Challenge(name: "Parcourir 12 km en 1 heure  ", image: "ChallPop2"),
        Challenge(name: "Découvrir 3 nouveaux sports dans le mois", image: "ChallPop3"),
        Challenge(name: "Faire 3 matchs avec 3 équipes différentes", image: "ChallPop4"),
        Challenge(name: "1000 pompes dans la semaine", image: "ChallPop1"),
        Challenge(name: "Parcourir 12 km en 1 heure  ", image: "ChallPop2"),
        Challenge(name: "Découvrir 3 nouveaux sports dans le mois", image: "ChallPop3"),
        Challenge(name: "Faire 3 matchs avec 3 équipes différentes", image: "ChallPop4"),
        Challenge(name: "1000 pompes dans la semaine", image: "ChallPop1"),
        Challenge(name: "Parcourir 12 km en 1 heure  ", image: "ChallPop2"),
        Challenge(name: "Découvrir 3 nouveaux sports dans le mois", image: "ChallPop3"),
        Challenge(name: "Faire 3 matchs avec 3 équipes différentes", image: "ChallPop4"),
        Challenge(name: "1000 pompes dans la semaine", image: "ChallPop1"),
        Challenge(name: "Parcourir 12 km en 1 heure  ", image: "ChallPop2"),
        Challenge(name: "Découvrir 3 nouveaux sports dans le mois", image: "ChallPop3"),
        Challenge(name: "Faire 3 matchs avec 3 équipes différentes", image: "ChallPop4"),
        
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $addChallenge, placeholder: "Rechercher des challenges")
                Divider()
                ScrollView{
                    GridStack(rows: (availableChallenge.count / 2) + 1, columns: 2) { row, col in
                        Spacer()
                        ChallengePopulaireView(popChall: self.getPopChallenge(row: row, col: col))
                            .gesture(TapGesture(count: 1)
                                .onEnded({()in
                                    print(self.isAdded)
                                    self.isAdded.toggle()
                                })
                        )
                        Spacer()
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }.navigationBarItems(leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss()
                }) { Text("Annuler")
                    .font(.subheadline)
                    .fontWeight(.regular)
                }
                ,trailing:
                HStack {
                    Button(action: { self.presentationMode.wrappedValue.dismiss()
                    }) { Text("valider")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }.foregroundColor(.blue)
            }).navigationBarTitle("Ajouter des challenges", displayMode: .inline)
        }
    }
    func searchData() -> [Challenge] {
        return (self.availableChallenge.filter { self.addChallenge.isEmpty ? true : $0.name.lowercased().contains(self.addChallenge.lowercased()) })
    }
    func getPopChallenge(row: Int, col: Int) -> Challenge? {
        let index = (row * 2) + col
        return index < self.searchData().count ? self.searchData()[index] : nil
    }
}
struct AddChallenge_Previews: PreviewProvider {
    static var previews: some View {
        AddChallenge(isAdded: .constant(false))
    }
}

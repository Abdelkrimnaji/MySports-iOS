//
//  MyChallenges.swift
//  MySports
//
//  Created by yvan pussard on 29/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct MyChallenges: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding var isAdded: Bool
    @State private var addChallenge = false
    @State private var showChallenge: Bool = false
    @State var currentIndex = 0
    @State var currentChallenge: Challenge
    
    var myChall: [MyChallenge] = [
        MyChallenge(name: "Parcourir 60km dans le mois", image: "Chall1", exp: 1),
        MyChallenge(name: "Gagnez 5 matchs dans le mois", image: "Chall2", exp: 8),
        MyChallenge(name: "Faire 2 backflip dans le mois", image: "montagne", exp: 5),
        MyChallenge(name: "Gagnez 5 matchs dans le mois", image: "Chall2", exp: 9),
    ]
    
    var challengePop: [Challenge] = [
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
                ScrollView {
                    ScrollView(.horizontal) {
                        GridStack(rows: 1 ,columns: (myChall.count) ) { row, col in
                            MyChallengeView(chall: self.getMyChallenge(row: row, col: col))
                                .padding(7)
                        }
                    }
                    Spacer()
                    Text("Populaire")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    GridStack(rows: (challengePop.count / 2 ) + 1 , columns: 2) { row, col in
                        ChallengePopulaireView(popChall: self.getPopChallenge(row: row, col: col))
                            .onTapGesture {
                                self.currentIndex = col + 2 * row
                                self.currentChallenge = self.challengePop[self.currentIndex]
                                self.showChallenge.toggle()
                        }.sheet(isPresented: self.$showChallenge) {
                            ChallengeView(c: self.currentChallenge)
                        }
                    }.padding()
                }
            }.navigationBarItems(trailing:
                Button(action: { self.addChallenge = true }) {
                    Image(systemName: "plus.circle")
                        .font(.headline)
                        .foregroundColor((Color(red: 0.26, green: 0.56, blue: 0.74)))
                }.sheet(isPresented: self.$addChallenge) {
                    AddChallenge(isAdded: self.$isAdded)
                }
            ).navigationBarTitle("Mes challenges", displayMode: .inline)
        }
    }
    private func getPopChallenge(row: Int, col: Int) -> Challenge? {
        let index = (row * 2) + col
        return index < self.challengePop.count ? challengePop[index] : nil
    }
    
    private func getMyChallenge(row: Int, col: Int) -> MyChallenge? {
        let index = (row * 2) + col
        return index < self.myChall.count ? myChall[index] : nil
    }
}

struct MyChallenges_Previews: PreviewProvider {
    static var previews: some View {
        MyChallenges(isAdded: .constant(false), currentChallenge: Challenge(name: "Parcourir 60km dans le mois", image: "Chall1"))
        
    }
}

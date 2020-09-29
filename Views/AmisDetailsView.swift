//
//  AmiDetailsView.swift
//  MySports
//
//  Created by Abdelkrim Naji on 29/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct AmiDetailsView: View {
    var amiDetails: MesAmisItem?
    var challengePop: [Challenge] = [
        Challenge(name: "Parcourir 12 km en 1 heure  ", image: "ChallPop2"),
        Challenge(name: "Découvrir 3 nouveaux sports dans le mois", image: "ChallPop3"),
        Challenge(name: "Faire 3 matchs avec 3 équipes différentes", image: "ChallPop4")
    ]
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Image(amiDetails!.profilImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30.0)
                VStack(alignment: .leading, spacing: 20){
                    if amiDetails!.lastName != nil{
                        Text(amiDetails!.lastName!)
                    }else{
                        Text("Petit")
                    }
                    Text(amiDetails!.profilName)
                    if amiDetails!.age != nil{
                        Text("\(amiDetails!.age!) ans")
                    }else{
                        Text("32 ans")
                    }
                }.padding(.leading)
            }.frame(maxHeight: 140)
            Divider()
            HStack {
                Text("Mes sports")
                    .font(.title)
            }
            VStack(alignment: .leading){
                ListeitemView(title: "Course à pied")
                ListeitemView(title: "Football")
                ListeitemView(title: "Cyclisme")
            }.padding()
            Divider()
            
            HStack(alignment: .center) {
                Text("Mes challenges")
                    .font(.title)
            }
            ScrollView{
                GridStack(rows: (challengePop.count / 2 ) + 1 , columns: 2) { row, col in
                    ChallengePopulaireView(popChall: self.getPopChallenge(row: row, col: col))
                }.padding(.leading)
            }
            Spacer()
        }.padding(.top)
    }
    
    private func getPopChallenge(row: Int, col: Int) -> Challenge? {
        let index = (row * 2) + col
        return index < self.challengePop.count ? challengePop[index] : nil
    }
}

struct AmiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AmiDetailsView(amiDetails: MesAmisItem(profilName: "Estelle", profilImage: "femme1"))
    }
}

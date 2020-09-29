//
//  HandicapView.swift
//  MySports
//
//  Created by Abdelkrim Naji on 30/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct HandicapView: View {
    let width = UIScreen.main.bounds.width
    var handicaps = ["Aucun handicap", "Handicap léger", "Handicap moteur membre inférieur", "Handicap psychique", "Handicap psychique et moteur","Sélectionner un niveau d'handicap"]
    @Binding var selectedHandicap: Int
    @Binding var handicapPicker: Bool
    @Binding var displayHandicapPicker: Bool
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack{
            
                ZStack{
                    Color.white
                    HStack{
                    Spacer()
                    Button(action: {
                        self.handicapPicker.toggle()
                        self.displayHandicapPicker.toggle()
                    }) { Text("Valider")
                        .font(.headline)
                        .foregroundColor((Color(red: 0.26, green: 0.56, blue: 0.74)))
                    }.padding([.bottom,.trailing],10)
                }
                
                }.frame(width: width, height: 30)
            Picker(selection: self.$selectedHandicap, label: Text("")) {
                ForEach(0 ..< handicaps.count) {
                    Text(self.handicaps[$0])
                }
            }.background(Color(red: 0.82, green: 0.83, blue: 0.85))
            .labelsHidden()
        }
    }
}

struct HandicapView_Previews: PreviewProvider {
    static var previews: some View {
        HandicapView(selectedHandicap: .constant(0), handicapPicker: .constant(false), displayHandicapPicker: .constant(false))
    }
}

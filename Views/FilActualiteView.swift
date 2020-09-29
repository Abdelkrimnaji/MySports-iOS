//
//  FilActualiteView.swift
//  MySports
//
//  Created by yvan pussard on 30/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct FilActualiteView: View {
    @Binding var isAdded: Bool
    @State var shareTitle: String = ""
    @State var showShare: Bool = false
    var list: [FilActuItem] = [
        FilActuItem(filActuName: "Regardez comme il vol haut !", filActuImage: "montagne", profilName: "Sébastopool", commentaire: "Quel peuf!"),
        FilActuItem(filActuName: "Quel peloton !", filActuImage: "peloton", profilName: "ça va vite!", commentaire: "Ça va vite !!!!!!"),
        FilActuItem(filActuName: "Workout à 14h au prado!", filActuImage: "muscu", profilName: "Jean Eude", commentaire: "musculation")
    ]
    let width = UIScreen.main.bounds.width
    var body: some View {
        
        VStack{
            if self.showShare == true{
                ZStack{
                    VStack(alignment: .leading) {
                        Text("Titre")
                            .font(.headline)
                        TextField("Entrer votre titre", text: $shareTitle)
                            .font(.subheadline)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                        ).padding(.bottom)
                        Text("Description")
                            .font(.headline)
                        TextField("Entrer une description", text: $shareTitle)
                            .font(.subheadline)
                            .padding(10)
                            .frame(height: 80)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                        ).padding(.bottom)
                        Text("Photo")
                            .font(.headline)
                        Button(action: { self.showShare.toggle()} ) {
                            Image(systemName: "camera.fill")
                                .font(.title)
                            Text("Ajouter une photo").font(.subheadline)
                        }
                        .padding()
                        .frame(width: width-20, height: 150.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                        )
                            .foregroundColor((Color(red: 0.26, green: 0.56, blue: 0.74)))
                            .cornerRadius(10.0)
                        
                        HStack(alignment: .center) {
                            Spacer()
                            Button(action: { self.showShare.toggle()} ) {
                                Text("Partager")
                                    .font(.title)
                            }
                            .padding()
                            .frame(width: width-100)
                            .background(Color(red: 0.26, green: 0.56, blue: 0.74))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                            Spacer()
                        }
                    }.padding([.leading,.trailing])
                }
            }
            if self.showShare == false{
                Button(action: {
                        self.showShare.toggle()
                    } ) {
                    Text("Que veux-tu partager?")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        .frame(width: UIScreen.main.bounds.width-50)
                }.foregroundColor(.black)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                ).frame(width: UIScreen.main.bounds.width)
                    .font(.title)
            }
            if self.showShare == true{
                List(list){ news in
                    NewsView(newsView: news)
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .fill((Color(red: 0, green: 0, blue: 0, opacity: 0.4)))
                )
                    
            }else{
                List(list){ news in
                    NewsView(newsView: news)
                }
            }
        }
    }
}

struct FilActualiteView_Previews: PreviewProvider {
    static var previews: some View {
        FilActualiteView(isAdded: .constant(false))
    }
}

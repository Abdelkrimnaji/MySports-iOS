//
//  ChallengeView.swift
//  MySports
//
//  Created by yvan pussard on 30/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ChallengeView: View {
    var c: Challenge
    
    var body: some View {
        ScrollView{
        VStack{
            VStack(alignment: .leading){
                Image(self.c.image)
                    .resizable()
                    .frame(height: 350.0)
                    .scaledToFit()
                    .overlay(
                        HStack{
                            VStack{
                                Spacer()
                                Text(self.c.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 250.0)
                                    .background(Color(red: 0.26, green: 0.56, blue: 0.74, opacity: 0.4))
                                Spacer()
                            } .padding(.top, 220)
                            VStack{
                                Spacer()
                                ZStack{
                                    Spacer()
                                    Circle()
                                        .frame(width: 90.0, height: 90.0)
                                        .foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                                    Text("💪")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.white)
                                }
                                .padding(.top, 325.0)
                            }
                        }
                )
            }
            HStack{
                Rectangle().frame(width: 10.0, height: 15.0)
                    .foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                Rectangle().frame(width: 10.0, height: 30.0)
                    .foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                    .padding(.bottom, 15.0)
                    .padding(-5.0)
                Rectangle().frame(width: 10.0, height: 45.0)
                    .foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                    .opacity(0.3)
                    .padding(.bottom, 30.0)
                Text("Medium")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.leading)
            VStack(){
                Spacer()
                VStack{
                    HStack {
                        Text("Exécution : ")
                                .font(.headline)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            .padding(.bottom)
                        Spacer()
                    }
                        Text("* Mettez-vous en position de planche, avec les mains plus écartées que les épaules.\n  \n* Vous devez avoir un alignement parfait entre les chevilles, le bassin et les épaules.\n  \n* Engagez votre sangle abdominale, le regard légèrement au-dessus des mains.\n  \n* Engagez votre sangle abdominale, le regard légèrement au-dessus des mains.\n  \n* Fléchissez vos bras pour descendre la poitrine le plus proche du sol possible, puis poussez dans vos paumes de mains pour repousser le sol et revenir en position de base.\n  \n* Inspirez et contrôlez la descente, expirez et remontez.\n  \n* Inspirez et contrôlez la descente, expirez et remontez.")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    .lineLimit(nil)
                }.padding()
                Spacer()
            }
        }
    }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(c: Challenge(name: "1000 pompes dans la semaine" ,image: "ChallPop1"))
    }
}

//
//  MyChallengeView.swift
//  MySports
//
//  Created by yvan pussard on 29/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct MyChallengeView: View {
    var chall: MyChallenge?
    var body: some View {
        Group{
            if self.chall != nil{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 14.0 / 255, green: 15.0 / 255, blue: 15.0 / 255, opacity: 0.5), lineWidth: 1)
                    ).foregroundColor(Color(red: 150 / 255, green: 159 / 255, blue: 170 / 255, opacity: 0.1))
                        .frame(width: 300, height: 250)
                    VStack(alignment: .center) {
                        Image(chall!.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150.0)
                            .cornerRadius(15)
                            .shadow(radius: 1)
                        Text(chall!.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        challengeXp(value: chall!.exp)
                        Text("\(chall!.exp * 10)%")
                    }
                }
            }else{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white).frame(width: 300, height: 250)
            }
        }
    }
}

struct MyChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        MyChallengeView(chall: MyChallenge(name: "Parcourir 60km dans le mois", image: "Chall1", exp: 1))
    }
}

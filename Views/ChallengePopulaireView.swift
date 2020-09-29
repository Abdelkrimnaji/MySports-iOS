//
//  ChallengePopulaireView.swift
//  MySports
//
//  Created by yvan pussard on 29/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ChallengePopulaireView: View {
    let width = (UIScreen.main.bounds.width/2)-20
    var popChall: Challenge?
    var body: some View {
        Group{
            if self.popChall != nil{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 14.0 / 255, green: 15.0 / 255, blue: 15.0 / 255, opacity: 0.5), lineWidth: 1)
                    )
                        .frame(width: width, height: 150)
                        .foregroundColor(Color(red: 150 / 255, green: 159 / 255, blue: 170 / 255, opacity: 0.1))
                    VStack(alignment: .center) {
                        Image(popChall!.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 100)
                            .cornerRadius(15)
                            .padding(.top, 15.0)
                            .padding(.bottom, -3)
                            .shadow(radius: 1)
                        Text(popChall!.name)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.bottom, 10)
                            .padding(.leading,10)
                    }
                }
            }else{
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white).frame(width: width, height: 150)
            }
        }
    }
}

struct ChallengePopulaireView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengePopulaireView()
    }
}

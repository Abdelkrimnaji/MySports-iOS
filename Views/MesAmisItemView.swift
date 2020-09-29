//
//  MesAmisItemView.swift
//  MysportApp
//
//  Created by Nathanael Lorsold on 26/06/2020.
//  Copyright © 2020 Nathanael Lorsold. All rights reserved.
//

import SwiftUI

struct MesAmisItemView: View {
    @Binding var amis: MesAmisItem
    let width = (UIScreen.main.bounds.width/2)-20
    @State var isAdded: Bool = false
    @State var isMyFriend: Bool = false
    var body: some View {
        Group{
                VStack{
                    ZStack{
//                        if self.isAdded == true{
//                            Image(amis.profilImage)
//                                .resizable()
//                                .scaledToFit()
//                                .cornerRadius(30.0)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 30)
//                                        .foregroundColor(.green)
//                                        .opacity(0.5), alignment: .bottom
//                            )
//                            Image(systemName: "checkmark")
//                                .foregroundColor(.green)
//                                .font(.largeTitle)
//                        }else{
                            Image(amis.profilImage)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30.0)
//                        }
                    }.frame(width: 140,height: 100)
//                    .frame(maxWidth: width)
                        .onTapGesture {
                            self.isAdded.toggle()
                            self.amis.isMyFriend = true
                    }
                    Text(amis.profilName)
                        .font(.headline)
                }.padding(.bottom)
            
        }
    }
    
    struct MesAmisItemView_Previews: PreviewProvider {
        static var previews: some View {
            MesAmisItemView(amis: .constant(MesAmisItem(profilName: "estelle", profilImage: "femme1", isAdded: false)))
        }
    }
}

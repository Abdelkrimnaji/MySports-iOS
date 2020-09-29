//
//  MySportProfil.swift
//  MysportApp
//
//  Created by Nathanael Lorsold on 23/06/2020.
//  Copyright © 2020 Nathanael Lorsold. All rights reserved.
//

import SwiftUI

struct MySportProfil: View {
    @State private var addAmisModal: Bool = false
    @Binding var isAdded: Bool
    @ObservedObject var friendsList = displayFriends()
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                Spacer()
                HStack(alignment: .center){
                    Image("hommeprofile")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30.0)
                    
                    VStack(alignment: .leading, spacing: 20){
                        Text("John")
                            .font(.headline)
                        Text("Doe")
                            .font(.custom("Monaco", size: 15))
                        Text("30 ans")
                        .font(.custom("Helvetica Neue", size: 15))
                    }.padding(.leading)
                }.frame(maxHeight: 140)
                Divider()
                HStack {
                    Text("Mes sports")
                        .font(.title)
                }
                Spacer()
                VStack(alignment: .leading){
                    ListeitemView(title: "Basketball")
                    ListeitemView(title: "Musculation")
                }.padding()
                Divider()
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("Mes amis")
                        .font(.title)
                    Spacer()
                    Button (action: { self.addAmisModal = true}) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                            .font(.title)
                    }.padding(.trailing)
                }
                ScrollView{
                    MesAmisView(friendsList: friendsList)
                }
            }.sheet(isPresented: self.$addAmisModal) {
                AddAmisView(isAdded: self.isAdded, friendsList: self.friendsList)
            }
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}

struct MySportProfil_Previews: PreviewProvider {
    static var previews: some View {
        MySportProfil(isAdded: .constant(false))
    }
}

//
//  AddAmis.swift
//  MysportApp
//
//  Created by Nathanael Lorsold on 26/06/2020.
//  Copyright © 2020 Nathanael Lorsold. All rights reserved.
//

import SwiftUI

struct AddAmisView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var ajouterAmis : String = ""
    @State var isAdded: Bool
    let width = UIScreen.main.bounds.width
    @ObservedObject var friendsList: displayFriends
    
    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $ajouterAmis, placeholder: "Rechercher un ami")
                Divider()
                ScrollView{
                    GridStack(rows: (searchData().count / 2) + 1, columns: 2) { row, col in
                        Spacer()
                        if self.getDataItems(row: row, col: col) == nil{
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 140,height: 100)
                        }else{
                            MesAmisItemView(amis: self.binding(row: row, col: col))
                        }
                        Spacer()
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationBarItems(leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss()
                }) { Text("Annuler")
                    .font(.subheadline)
                    .fontWeight(.regular)
                }
                ,trailing:
                HStack {
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Text("valider")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }.foregroundColor(.blue)
            }).navigationBarTitle("Ajouter des amis", displayMode: .inline)
        }
    }
    
    
    func binding(row:Int, col:Int) -> Binding<MesAmisItem>{
        self.$friendsList.globalAmisList[self.friendsList.globalAmisList.firstIndex(where: {$0.id.hashValue == self.getDataItems(row: row, col: col)!.id.hashValue})!]
    }
    
    func searchData() -> [MesAmisItem] {
        return (self.friendsList.globalAmisList.filter { self.ajouterAmis.isEmpty ? $0.isMyFriend != true : $0.profilName.lowercased().contains(self.ajouterAmis.lowercased()) })
    }
    
    private func getDataItems(row: Int, col: Int) -> MesAmisItem? {
        let index = (row * 2) + col
        return index < self.searchData().count ? self.searchData()[index] : nil
    }
}

struct AddAmisView_Previews: PreviewProvider {
    static var previews: some View {
        AddAmisView(isAdded: false, friendsList: displayFriends())
    }
}

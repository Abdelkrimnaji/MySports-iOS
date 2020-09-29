//
//  MesAmisView.swift
//  MysportApp
//
//  Created by Nathanael Lorsold on 26/06/2020.
//  Copyright © 2020 Nathanael Lorsold. All rights reserved.
//

import SwiftUI

struct MesAmisView: View {
    @ObservedObject var friendsList: displayFriends
    
    var body: some View {
        GridStack(rows: (searchData().count / 2) + 1, columns: 2) { row, col in
//            Spacer()
            NavigationLink(destination: AmiDetailsView(amiDetails: self.getDataItems(row: row, col: col))){
                if self.getDataItems(row: row, col: col) == nil{
                    Spacer()
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 140,height: 100)
                    Spacer()
                }else{
                    Spacer()
                    MesAmisItemView(amis: self.binding(row: row, col: col))
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
//            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
    func binding(row:Int, col:Int) -> Binding<MesAmisItem>{
        self.$friendsList.globalAmisList[self.friendsList.globalAmisList.firstIndex(where: {$0.id.hashValue == self.getDataItems(row: row, col: col)!.id.hashValue})!]
    }
    
    func searchData() -> [MesAmisItem] {
        return (self.friendsList.globalAmisList.filter({$0.isMyFriend == true}))
    }
    
    private func getDataItems(row: Int, col: Int) -> MesAmisItem? {
        let index = (row * 2) + col
        return index < self.searchData().count ? self.searchData()[index] : nil
    }
}

struct MesAmisView_Previews: PreviewProvider {
    static var previews: some View {
        MesAmisView(friendsList: displayFriends())
    }
}

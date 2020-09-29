//
//  ActivitiesView.swift
//  TabBar
//
//  Created by Abdelkrim Naji on 22/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ActivitiesTab: View {
    
    let width = (UIScreen.main.bounds.width/2)-20
    @State private var searchText : String = ""
    @State private var showFilters: Bool = false
    @State private var createEvenment: Bool = false
    @State private var showActivity: Bool = false
    @State var currentIndex = 0
    @State var currentActivity: ActivitiesItem
    
    let activitiesData: [ActivitiesItem] = [
        ActivitiesItem(name: "Football", image: "CR7", color: Color.orange),
        ActivitiesItem(name: "Basketball", image: "Lebron", color: Color.purple),
        ActivitiesItem(name: "Running", image: "Bolt", color: Color.blue),
        ActivitiesItem(name: "Tennis", image: "Federer", color: Color.red),
        ActivitiesItem(name: "Cyclisme", image: "Cyclisme", color: Color.green),
        ActivitiesItem(name: "Musculation", image: "musculation", color: Color.orange),
        ActivitiesItem(name: "Escalade", image: "escalade", color: Color.purple),
        ActivitiesItem(name: "boxe", image: "boxe", color: Color.blue),
        ActivitiesItem(name: "Rugby", image: "rugby", color: Color.red),
        ActivitiesItem(name: "Danse", image: "danse", color: Color.yellow),
        ActivitiesItem(name: "Baseball", image: "baseball", color: Color.green)
    ]
    
    
    @State private var filtredSearch: Bool = false
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(alignment: .leading) {
                    SearchBar(text: $searchText, placeholder: "Rechercher une activité")
                    Divider()
                    VStack(alignment: .leading) {
                        Button(action: { self.createEvenment = true }) {
                            Image(systemName: "plus.circle")
                            Text("Créer un évènement")
                        }.sheet(isPresented: self.$createEvenment) {
                            CreateEvenmentView(createEvenment: self.$createEvenment)
                        }
                        .font(.headline)
                        .foregroundColor(Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.7))
                        Button(action: { self.showFilters = true }) {
                            Image(systemName: "plus.circle")
                            Text("Filtres")
                        }.font(.headline)
                            .foregroundColor(Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.7))
                            .sheet(isPresented: self.$showFilters) {
                                ActivitiesFilters(filtredSearch: self.$filtredSearch)
                        }
                    }.padding(.leading)
                    
                    
                    GridStack(rows:  (self.filtredSearch == false ? activitiesData.count / 2 + 1 : 1), columns: 2) { row, col in
                        ActivitiesView(activity: self.getDataItems(row: row, col: col))
                            .onTapGesture {
                                self.currentIndex = col + 2 * row
                                self.currentActivity = self.activitiesData[self.currentIndex]
                                self.showActivity.toggle()
                        }.sheet(isPresented: self.$showActivity) {
                            ActivityMap(a: self.currentActivity)
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        .navigationBarTitle("Activités", displayMode: .inline)
                }
                
            } .contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.shared.endEditing()
            }
        }
    }
    
    // function permettant de filtrer les recherches tapées dans la searchBar
    func searchData() -> [ActivitiesItem] {
        return (self.activitiesData.filter { self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased()) })
    }
    
    //    Fonction qui retour l'index dans notre liste pour la gridStack
    private func getDataItems(row: Int, col: Int) -> ActivitiesItem? {
        let index = (row * 2) + col
        return index < self.searchData().count ? self.searchData()[index] : nil
    }
}

struct ActivitiesTab_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesTab(currentActivity: ActivitiesItem(name: "Football", image: "CR7", color: Color.orange))
    }
}

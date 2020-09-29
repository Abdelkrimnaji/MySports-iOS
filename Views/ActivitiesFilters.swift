//
//  ActivitiesFilters.swift
//  MySports
//
//  Created by Abdelkrim Naji on 23/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ActivitiesFilters: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var location: String = ""
    @State private var distanceToMe: Double = 100
    @State private var activityPrice: Double = 100
    @State private var activityLevel: Double = 50
    let width = UIScreen.main.bounds.width
    var handicaps = ["Aucun handicap", "Handicap léger", "Handicap moteur membre inférieur", "Handicap psychique", "Handicap psychique et moteur","Sélectionner un niveau d'handicap"]
    @State private var selectedHandicap = 5
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "d/M/y"
        return formatter
    }
    @State private var activityDate = Date()
    @State private var displayDatePicker = false
    @State private var displayHandicapPicker = false
    @State private var handicapPicker = false
    @Binding var filtredSearch: Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    VStack{
                        Spacer()
                        VStack(alignment: .leading) {
                            VStack{
                                VStack(alignment: .leading) {
                                    Text("Localisation")
                                        .font(.headline)
                                    TextField("Saisir une adresse", text: $location)
                                        .font(.subheadline)
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                                    )
                                    Text("Dans un rayon de")
                                        .padding(.top)
                                        .font(.subheadline)
                                    Slider(value: $distanceToMe, in: 0...100)
                                        .accentColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                                    HStack{
                                        Text("0 km")
                                        Spacer()
                                        Text("\(Int(distanceToMe)) km")
                                    }.font(.subheadline)
                                }.padding([.leading,.trailing])
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Prix")
                                        .font(.headline)
                                    Slider(value: $activityPrice, in: 0...100)
                                        .accentColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                                    HStack{
                                        Text("0 €")
                                        Spacer()
                                        Text("\(Int(activityPrice)) €")
                                    }.font(.subheadline)
                                }.padding([.top,.leading,.trailing])
                                Spacer()
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Date")
                                        .font(.headline)
                                        Spacer()
                                    }
                                    Button(action: { self.displayDatePicker.toggle() }) {
                                        Text("\(activityDate, formatter: dateFormatter)")
                                        Image(systemName: "calendar")
                                    }.padding(10)
                                        .foregroundColor(Color.gray)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                                    )
                                    if self.displayDatePicker {
                                        DatePicker(selection: $activityDate, in: Date()..., displayedComponents: .date, label: {
                                            Text("")
                                        })
                                    }
                                }.padding([.top,.leading,.trailing]).frame(width: width)
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Niveau")
                                        .font(.headline)
                                    Slider(value: $activityLevel, in: 0...100)
                                        .accentColor(Color(red: 0.26, green: 0.56, blue: 0.74))
                                    HStack{
                                        Text("Débutant")
                                        Spacer()
                                        Text("Pro")
                                    }.font(.subheadline)
                                }.padding([.top,.leading,.trailing])
                                Spacer()
                            }.overlay(
                                VStack {
                                    if self.handicapPicker {
                                        Rectangle()
                                            .fill((Color(red: 0, green: 0, blue: 0, opacity: 0.4)))
                                    } else {
                                        EmptyView()
                                    }
                                }
                            ).frame(maxWidth: .infinity)
                            VStack(alignment: .leading) {
                                Text("Handicap")
                                    .font(.headline)
                                    .padding(.bottom)
                                Button(action: { self.handicapPicker.toggle() }) {
                                    Text(handicaps[selectedHandicap])
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        .foregroundColor(Color.gray)
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                                    )
                                }
                            }.padding([.top,.leading])
                        }
                    }
                    if self.handicapPicker {
                        ZStack{
                            HandicapView(selectedHandicap: $selectedHandicap, handicapPicker: self.$handicapPicker, displayHandicapPicker: self.$displayHandicapPicker)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }.background(Color(red: 0.82, green: 0.83, blue: 0.85))
                            .labelsHidden()
                    }
                }
            }.navigationBarItems(leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss()
                    self.filtredSearch = false
                }) { Text("Annuler")
                    .font(.subheadline)
                    .fontWeight(.regular)
                }
                ,trailing:
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.filtredSearch = true}) {
                            Text("valider")
                                .font(.subheadline)
                                .fontWeight(.bold)
                    }.foregroundColor(.blue)
            }).navigationBarTitle("Filtres", displayMode: .inline)
        }
    }
}

struct ActivitiesFilters_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesFilters(filtredSearch: .constant(false))
    }
}

//
//  CreateEvenment.swift
//  MySports
//
//  Created by Abdelkrim Naji on 23/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct CreateEvenmentView: View {
    @Environment(\.presentationMode) private var presentationMode
    let width = UIScreen.main.bounds.width
    var handicaps = ["Aucun handicap", "Handicap léger", "Handicap moteur membre inférieur", "Handicap psychique", "Handicap psychique et moteur","Sélectionner un niveau d'handicap"]
    @State private var activityLevel: Double = 50
    @State private var selectedHandicap = 5
    @State private var locationEvenment: String = ""
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "dd/MM/y hh:mm"
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter
    }
    
    @State private var evenmentDate = Date()
    @State private var displayDatePicker = false
    @State private var displayHandicapPicker = false
    @State private var priceEvenment:String = ""
    @State private var nameEvenment:String = ""
    @Binding var createEvenment: Bool
    
    @State private var handicapPickerEvenment = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                VStack{
                VStack(alignment: .leading){
                    Text("Activité")
                        .font(.headline)
                    TextField("Saisir un nom d'activité", text: $nameEvenment)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                    )
                }.padding()
                VStack(alignment: .leading){
                    Text("Où ça?")
                        .font(.headline)
                    TextField("Saisir une adresse", text: $locationEvenment)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                    )
                }.padding()
                
                VStack(alignment: .leading){
                    HStack {
                        Text("Date")
                            .font(.headline)
                        Spacer()
                    }
                    Button(action: { self.displayDatePicker.toggle() }) {
                        Text("\(evenmentDate, formatter: dateFormatter)")
                        Image(systemName: "calendar")
                    }.padding(10)
                        .foregroundColor(Color.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                    )
                    if self.displayDatePicker {
                        DatePicker(selection: $evenmentDate, in: Date()..., label: {
                            Text("")
                        })
                    }
                }.padding()
                
                VStack(alignment: .leading){
                    Text("Prix")
                        .font(.headline)
                    TextField("Saisir un prix", text: $priceEvenment)
                        //                                        .returnKeyType: done
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke((Color(red: 0.26, green: 0.56, blue: 0.74)), lineWidth: 1)
                    )
                        .keyboardType(.decimalPad)
                    //                .returnKeyType: done
                }.padding()
                
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
                }.padding()
                }.overlay(
                    VStack {
                        if self.displayHandicapPicker {
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
                    Button(action: { self.displayHandicapPicker.toggle() }) {
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
                }.padding([.top, .leading])
                if self.displayHandicapPicker {
                    ZStack{
                        HandicapView(selectedHandicap: $selectedHandicap, handicapPicker: self.$handicapPickerEvenment, displayHandicapPicker: self.$displayHandicapPicker)
                            .frame(maxWidth: .infinity)
                    }.background(Color(red: 0.82, green: 0.83, blue: 0.85))
                }
            }.contentShape(Rectangle())
            .onTapGesture {
                UIApplication.shared.endEditing()
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
            }).navigationBarTitle("Créer un évènement", displayMode: .inline)
        }
    }
}
extension UIApplication {
      func endEditing() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
struct CreateEvenment_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvenmentView(createEvenment: .constant(false))
    }
}

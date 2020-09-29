//
//  ContentView.swift
//  TabBar
//
//  Created by Abdelkrim Naji on 14/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ContentView: View {
     @Binding var isAdded: Bool
    var body: some View {
        TabView {
            ActivitiesTab(currentActivity: ActivitiesItem(name: "Football", image: "CR7", color: Color.orange))
                .tabItem {
                    Image("sport_icon-4")
                    Text("Activités")
                }
            FilActualiteView(isAdded: self.$isAdded)
                .tabItem {
                    Image(systemName: "macwindow")
                    Text("Fil d'actualités")
                }
            MyChallenges(isAdded: self.$isAdded,currentChallenge: Challenge(name: "Parcourir 60km dans le mois", image: "Chall1"))
                .tabItem {
                    Image(systemName: "star.circle.fill")
                    Text("Challenges")
                }
            MySportProfil(isAdded: self.$isAdded)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct Actualities: View {
    var body: some View {
        Color.red
    }
}
struct Challenges: View {
    var body: some View {
        Color.yellow
    }
}
struct Profile: View {
    var body: some View {
        Color.green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isAdded: .constant(false))
    }
}

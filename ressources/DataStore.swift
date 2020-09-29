//
//  DataStor.swift
//  MysportApp
//
//  Created by Nathanael Lorsold on 26/06/2020.
//  Copyright © 2020 Nathanael Lorsold. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class displayFriends: ObservableObject {
   @Published var globalAmisList: [MesAmisItem] = [
        MesAmisItem(profilName: "Estelle", profilImage: "femme1", isMyFriend: true, genre: "female", age: 42, lastName: "Martin"),
        MesAmisItem(profilName: "Charlene", profilImage: "femme2", isMyFriend: true, genre: "female", age: 26, lastName: "Dupond"),
        MesAmisItem(profilName: "Fred", profilImage: "homme1", isMyFriend: true, genre: "male",age: 40,lastName: "Durant"),
        MesAmisItem(profilName: "Pierre", profilImage: "homme2", isMyFriend: true, genre: "male",age: 36, lastName: "Pusey"),
        MesAmisItem(profilName: "Kry", profilImage: "femme4", isMyFriend: true),
        MesAmisItem(profilName: "Alexia", profilImage: "femme7"),
        MesAmisItem(profilName: "Eddy", profilImage: "homme7"),
        MesAmisItem(profilName: "Vincent", profilImage: "homme2"),
        MesAmisItem(profilName: "Emma", profilImage: "femme6"),
        MesAmisItem(profilName: "Elise", profilImage: "femme3"),
        MesAmisItem(profilName: "Eric", profilImage: "homme4"),
        MesAmisItem(profilName: "Nathalie", profilImage: "femme9")
    ]
}

struct MesAmisItem: Identifiable {
    var id = UUID ()
    var profilName: String
    var profilImage: String
    var isAdded: Bool = false
    var isMyFriend: Bool = false
    var genre: String?
    var age: Int?
    var lastName: String?
}

struct ActivitiesItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var color: Color
}
struct Challenge: Identifiable {
      var id = UUID()
      var name: String
      var image: String
  }
struct MyChallenge: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var exp: Int
}
struct FilActuItem: Identifiable {
    var id = UUID()
    var filActuName: String
    var filActuImage: String
    var profilName: String
    var commentaire: String
    
}


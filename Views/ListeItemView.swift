//
//  ListeitemView.swift
//  MysportApp
//
//  Created by Nathanael Lorsold on 26/06/2020.
//  Copyright © 2020 Nathanael Lorsold. All rights reserved.
//

import SwiftUI

struct ListeitemView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Image(systemName:"star.fill").foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
            Image(systemName:"star.fill").foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
            Image(systemName:"star.fill").foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
            Image(systemName:"star.lefthalf.fill").foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
            Image(systemName:"star").foregroundColor(Color(red: 0.26, green: 0.56, blue: 0.74))
        }
    }
    
    struct ListeitemView_Previews: PreviewProvider {
        static var previews: some View {
            ListeitemView (title:"Basketball")
        }
    }
}

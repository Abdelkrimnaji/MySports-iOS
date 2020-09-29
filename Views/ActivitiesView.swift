//
//  ActivitiesView.swift
//  MySports
//
//  Created by Abdelkrim Naji on 26/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ActivitiesView: View {
    let width = (UIScreen.main.bounds.width/2)-20
    var activity: ActivitiesItem?
    var body: some View {
        Group{
            if self.activity != nil{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(activity!.color).frame(width: width, height: 250)
                    VStack(alignment: .center) {
                        Text(activity!.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Image(activity!.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 150, maxHeight: 150.0)
                    }
                }
            }else{
                RoundedRectangle(cornerRadius: 15)
                .fill(Color.white).frame(width: width, height: 250)
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}

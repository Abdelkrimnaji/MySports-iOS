//
//  ActivityMap.swift
//  MySports
//
//  Created by yvan pussard on 24/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct ActivityMap: View {
    var a: ActivitiesItem
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                ZStack{
                    Rectangle()
                        .frame(height: 55)
                        .foregroundColor(self.a.color)
                    HStack{
                        Text(self.a.name)
                            .foregroundColor(.white)
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                }
                MapView(currentActivity: ActivitiesItem(name: self.a.name, image: self.a.image, color: self.a.color))
                    .frame(maxHeight: .infinity)
                VStack(alignment: .leading) {
                    HStack(alignment: .center){
                        Text("Street Park")
                            .font(.headline)
                        Spacer()
                        Text("5 €")
                            .font(.subheadline)
                    }
                    Text("15 rue des lilas, 69002 Lyon")
                        .font(.subheadline)
                        .padding(.top, 10.0)
                    
                }.padding()
                    .frame(maxWidth: .infinity)
//                Divider()
//                VStack(alignment: .leading) {
//                    HStack(alignment: .center){
//                        Text("Gymnase du mont rouge")
//                            .font(.headline)
//                        Spacer()
//                        Text("5 €")
//                            .font(.subheadline)
//                    }
//                    Text("15 rue des lilas, 69002 Lyon")
//                        .font(.subheadline)
//                        .padding(.top, 10.0)
//                    
//                }.padding()
//                    .frame(maxWidth: .infinity)
                VStack(alignment: .center) {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Participer")
                            .font(.title)
                    }
                    .padding()
                    .frame(width: 250.0)
                    .background(Color(red: 0.07, green: 0.81, blue: 0.4))
                    .foregroundColor(.white)
                    .cornerRadius(12.0)
                }
                .padding(.bottom, 5.0)
                .frame(maxWidth: .infinity, maxHeight: 150)
            }
        }
        
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ActivityMap_Previews: PreviewProvider {
    static var previews: some View {
        ActivityMap(a: ActivitiesItem(name: "Football", image: "CR7", color: Color.orange))
    }
}

//
//  challengeXp.swift
//  MySports
//
//  Created by yvan pussard on 29/06/2020.
//  Copyright © 2020 Abdelkrim Naji. All rights reserved.
//

import SwiftUI

struct challengeXp: View {

    var value: Int = 5
    var maximum: Int = 10
    var space: CGFloat = 0
    var selectedColor: Color = .green
    var unselectedColor: Color = Color.secondary.opacity(0.2)

    var body: some View {
        HStack(spacing: space) {
            ForEach(0 ..< maximum) { index in
            Rectangle()
            .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
            }
        }
    .frame(maxHeight: 15)
    .clipShape(Capsule())
    .padding(.horizontal)
    }
}

struct challengeXp_Previews: PreviewProvider {
    static var previews: some View {
        challengeXp(value: 5)
    }
}

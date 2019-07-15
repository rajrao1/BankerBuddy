//
//  CircleImage.swift
//  BankerBuddy
//
//  Created by Developer on 14/07/19.
//  Copyright © 2019 Developer. All rights reserved.
//


import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("banker")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4.0))
            .shadow(radius: 10.0)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif

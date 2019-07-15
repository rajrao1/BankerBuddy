//
//  ProfileView.swift
//  BankerBuddy
//
//  Created by Developer on 14/07/19.
//  Copyright © 2019 Developer. All rights reserved.
//


import SwiftUI

struct ProfileView : View {
    var body: some View {
        VStack {
            MapView().frame(height:300)               .edgesIgnoringSafeArea(.top)
        CircleImage().offset(y:-130).padding(.bottom, -130)
            VStack(alignment: .center) {
                Text("Mr. Banker")
                    .font(.title)
                        Text("Belgium's Big Bank")
                            .font(.subheadline)
                            Text("Brussels")
                                .font(.subheadline)
                    }
                    .padding()
            Spacer()

            }

    }
}

#if DEBUG
struct ProfileView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif

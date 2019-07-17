//
//  ContentView.swift
//  BankerBuddy
//
//  Created by Developer on 14/07/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
 
    var body: some View {
        TabbedView(selection: $selection){
            GoogleMapView()
                .font(.title)
                .tabItem {
                    Image("addressLocator")
                    Text("Address Finder")
            }
            .tag(0)
            ProfileView()
                .font(.title)
                .tabItem {
                    Image("profile")
                    Text("Profile")
            }
            .tag(1)
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

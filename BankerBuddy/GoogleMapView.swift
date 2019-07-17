//
//  GoogleMapView.swift
//  BankerBuddy
//
//  Created by Developer on 17/07/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct GoogleMapView : UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MapViewController {
        // Code
        return MapViewController();
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        // Code
    }
    
    
}

#if DEBUG
struct GoogleMapView_Previews : PreviewProvider {
    static var previews: some View {
        GoogleMapView()
    }
}
#endif

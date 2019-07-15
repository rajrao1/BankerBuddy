//
//  MapsViewControllerWrapper.swift
//  BankerBuddy
//
//  Created by Developer on 15/07/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
//import MapsViewController

struct MapsViewControllerWrapper : UIViewControllerRepresentable {
    typealias UIViewControllerType = MapsViewController
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        //
    }
}

//#if DEBUG
//struct MapsViewControllerWrapper_Previews : PreviewProvider {
//    static var previews: some View {
//        MapsViewControllerWrapper()
//    }
//}
//#endif

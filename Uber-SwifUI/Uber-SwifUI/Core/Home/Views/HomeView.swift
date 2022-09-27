//
//  HomeView.swift
//  Uber-SwifUI
//
//  Created by Safar Safarov on 27/09/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.top, 70)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

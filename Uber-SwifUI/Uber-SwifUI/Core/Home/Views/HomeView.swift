//
//  HomeView.swift
//  Uber-SwifUI
//
//  Created by Safar Safarov on 27/09/22.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    
    var body: some View {
        ZStack(alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            if mapState == .searchingForLocation {
                LocationSearchView(mapState: $mapState)
            } else if mapState == .searchingForLocation {
                LocationSearchActivationView()
                    .padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mapState = .searchingForLocation
                        }
                        
                    }
            }
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading, 25)
                .padding(.top, 4)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

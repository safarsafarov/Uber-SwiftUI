//
//  MapViewActionButton.swift
//  Uber-SwifUI
//
//  Created by Safar Safarov on 28/09/22.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        } label: {
            Image(systemName: showLocationSearchView ? "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("DEBUG: No Input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            print("DEBUG: Clear Map View...")
        }
    }
    
    func imageNameForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            print("DEBUG: Clear Map View...")
        }
    }
}


struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}

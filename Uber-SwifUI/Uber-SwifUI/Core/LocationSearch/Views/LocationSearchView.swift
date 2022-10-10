//
//  LocationSearchView.swift
//  Uber-SwifUI
//
//  Created by Safar Safarov on 27/09/22.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @Binding var mapState: MapViewState
    
    var body: some View {
        VStack {
            // Header
            // Dots
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemBlue))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .background(Color.theme.primaryTextColor)
                        .frame(width: 6, height: 6)
                }
                // Text Fields
                
                VStack {
                    
                    TextField("", text: $startLocationText)
                        .frame(height: 32)
                        .padding(.trailing)
                        .placeholder(when: startLocationText.isEmpty) {
                            Text(" Current Location").foregroundColor(.blue)
                                .padding(.leading, 4)
                    }
                    
                    TextField(" Enter Destination", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray6))
                        .cornerRadius(4)
                        .padding(.trailing)
                        .padding(.leading, 2)
                }

            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical, 10)
            
            // List
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backgroundColor)
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
            .environmentObject(LocationSearchViewModel())
    }
}

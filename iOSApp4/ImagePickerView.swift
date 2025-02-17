//
//  ImagePickerView.swift
//  iOSApp4
//
//  Created by Cristina Cabral on 2025-02-17.
//

import SwiftUI


struct ImagePickerView: View {
    let imageNames: [String]
    @Binding var selectedImageName: String?
    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedImageName = imageName
                        }
                }
            }
            .padding()
        }
    }
}

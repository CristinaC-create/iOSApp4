//
//  GalleryView.swift
//  iOSApp4
//
//  Created by Cristina Cabral on 2025-02-17.
//

import SwiftUI

struct GalleryView: View {
    let clues: [String]
    let selectedImageNames: [Int: String]
    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(clues.indices, id: \.self) { index in
                    VStack {
                        if let imageName = selectedImageNames[index] {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .cornerRadius(10)
                                .padding()
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .foregroundColor(.gray)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .padding()
                        }
                        Text(clues[index])
                            .font(.headline)
                            .padding()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Clue Gallery")
    }
}

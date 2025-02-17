//
//  ContentView.swift
//  iOSApp4
//
//  Created by Cristina Cabral on 2025-02-17.
//

import SwiftUI

struct ScavengerHuntView: View {
    
    let clues = [
        "Find a park with a river in the heart of the city, perfect for paddling or strolling.",
        "Explore a museum, in the core, filled with old artifacts from dinosaurs to ancient gold.",
        "Visit a bustling market in the heart of the city, for fresh produce and more.",
        "Find a university with a Western name and a grand campus.",
        "Look for a theatre on Richmond Street where performances shine.",
        "Wander through a garden full of blooms in a beautiful park.",
        "Discover a library in the downtown core with books galore.",
        "Catch a game or concert at a stadium where fans cheer loud.",
        "Follow a trail along the Thames, perfect for walks and runs.",
        "Find a children’s museum with interactive exhibits and creative fun."
    ]
    
    let imageNames = [
        "clue1",
        "clue2",
        "clue3",
        "clue4",
        "clue5",
        "clue6",
        "clue7",
        "clue8",
        "clue9",
        "clue10"
    ]
    
    @State private var foundItems: Set<Int> = []
    @State private var selectedImageNames: [Int: String] = [:]
    @State private var selectedClueIndex: Int? = nil
    @State private var isImagePickerPresented = false
    
    var discountMessage: String {
        switch foundItems.count {
        case 7...9:
            return "20% Discount Code: SCAVENGER5"
        case 5...6:
            return "10% Discount Code: SCAVENGER10"
        case 10:
            return "20% Discount Code: SCAVENGER20\nYou're entered into the $5000 draw!"
        default:
            return "No discount yet."
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background3")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.25)
                
                VStack {
                    Text("Welcome to London's Scavenger Hunt")
                        .font(.headline)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    
                    Text("Embark on an adventure, snap photos, and score awesome discounts!")
                        .font(.subheadline)
                        .padding(.bottom)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(clues.indices, id: \.self) { index in
                                VStack {
                                    Text(clues[index])
                                        .font(.headline)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                    
                                    if let imageName = selectedImageNames[index] {
                                        Image(imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 300)
                                            .cornerRadius(10)
                                            .padding()
                                    } else {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 300)
                                            .foregroundColor(.gray)
                                            .background(Color.gray.opacity(0.2))
                                            .cornerRadius(10)
                                            .padding()
                                        
                                        Button(action: {
                                            selectedClueIndex = index
                                            isImagePickerPresented = true
                                        }) {
                                            Text("Take Photo")
                                                .foregroundColor(.white)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color.purple)
                                                .cornerRadius(8)
                                        }
                                    }
                                    
                                    Button(action: {
                                        foundItems.insert(index)
                                    }) {
                                        Text(foundItems.contains(index) ? "Found!" : "Mark as Found")
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(foundItems.contains(index) ? Color.green : Color.purple)
                                            .cornerRadius(8)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    
                    NavigationLink(destination: GalleryView(clues: clues, selectedImageNames: selectedImageNames)) {
                        Text("Submit Results")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                    
                    Text(discountMessage)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                }
                .padding()
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePickerView(imageNames: imageNames, selectedImageName: Binding(get: {
                    selectedImageNames[selectedClueIndex ?? 0] ?? ""
                }, set: { newValue in
                    if let index = selectedClueIndex {
                        selectedImageNames[index] = newValue
                    }
                    isImagePickerPresented = false
                }))
            }
        }
    }
}


struct ScavengerHuntView_Previews: PreviewProvider {
    static var previews: some View {
        ScavengerHuntView()
    }
}

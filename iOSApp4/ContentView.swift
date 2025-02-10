//
//  ContentView.swift
//  iOSApp4
//
//  Created by Cristina Cabral on 2025-02-07.
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
    
    @State private var foundItems: Set<Int> = []
    @State private var selectedImage: UIImage? = nil
    
    var discountMessage: String? {
        switch foundItems.count {
        case 7...9:
            return "20% Discount Code: SCAVENGER20"
        case 5...6:
            return "10% Discount Code: SCAVENGER10"
        case 10:
            return "50% Discount Code: SCAVENGER50 \nYou have been entered into the $5000 grand prize"
        default:
            return "No discount yet"
        }
    }
    
    var body: some View {
        VStack {
            Text("Welcome to London's Scavenger Hunt")
                .font(.headline)
                .padding()
            Text("Embark on an adventure, snap photos, and score awesome discounts!")
                .font(.subheadline)
                .padding(.bottom)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(clues.indices, id: \.self) { index in
                        VStack {
                            Text(clues[index])
                                .font(.headline)
                                .padding()
                            Button(action:  {
                                foundItems.insert(index)
                            }) {
                                Text(foundItems.contains(index) ? "Found!" : "Take Photo")
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
            Button(action: {
                print("Results Submitted: \(foundItems.count) Items Found.")
            }) {
                Text("Submit Results")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .cornerRadius(8)
            }
            .padding()
            Text(discountMessage ?? "")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
            
        }
        .padding()
        .background(
            Image("background3")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.25)
        )
    }
}

struct ScavengerHuntView_Previews: PreviewProvider {
    static var previews: some View {
        ScavengerHuntView()
    }
}

//
//  iOSApp4App.swift
//  iOSApp4
//
//  Created by Cristina Cabral on 2025-02-07.
//

import SwiftUI

@main
struct iOSAapp4: App {
    @StateObject var userManager = UserManager()
    var body: some Scene {
        WindowGroup {
               if userManager.currentUser == nil {
                   SplashScreenView()
                       .environmentObject(userManager)
                } else {
                   ScavengerHuntView()
                        
               }
            }
        }
    }

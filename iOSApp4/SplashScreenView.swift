//
//  SplashScreenView.swift
//  iOSApp4
//
//  Created by Cristina Cabral on 2025-02-13.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRegistering = false
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image("splashview")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .opacity(0.25)
                
                Text("Welcome to London's Scavenger Hunt")
                    .font(.headline)
                    .bold()
                    .padding()
                
                if isRegistering {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Register") {
                        userManager.register(username: username, email: email, password: password)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                } else {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button("Login") {
                        if userManager.login(email: email, password: password) {
                            print("Login Successful")
                        } else {
                            print("Invalid Username or Password")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                }
                
                Button(isRegistering ? "Go to Login" : "Create an Account") {
                    isRegistering.toggle()
                }
                .padding()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView().environmentObject(UserManager())
    }
}

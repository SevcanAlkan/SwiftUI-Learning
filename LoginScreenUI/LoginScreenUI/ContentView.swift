//
//  ContentView.swift
//  LoginScreenUI
//
//  Created by Sevcan Alkan on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.36)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width:300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Your are logged in @\(username)"), isActive: $showLoginScreen){
                        EmptyView()
                    }
                    
                }
            }
        }.navigationBarHidden(false)
    }
    
    func authenticateUser(username: String, password: String) {
        if username.lowercased() != "sevcan" || password.lowercased() != "1" {
            wrongPassword = 2
            wrongUsername = 2
            return
        }
        
        if username.lowercased() == "sevcan" && password.lowercased() == "1" {
            wrongUsername = 0
            wrongPassword = 0
            showLoginScreen = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

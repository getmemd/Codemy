//
//  Home.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 25.05.2021.
//

import SwiftUI

struct Home: View {
    @State private var selection: Tab = .home
    @State private var needsAuth = true
    
    enum Tab {
        case home
        case course
        case code
        case discussions
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeGrid()
                .tabItem { Label("Home", systemImage: "house") }
            Text("Course")
                .tabItem { Label("Course", systemImage: "graduationcap") }
            TextEditor()
                .tabItem { Label("Code", systemImage: "chevron.left.slash.chevron.right") }
            DiscussionsList()
                .tabItem { Label("Discussions", systemImage: "text.bubble") }
            ProfileHost(viewModel: ProfileHost.ViewModel())
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .sheet(isPresented: $needsAuth) {
            needsAuth = false
        } content: {
            Authorization(needsAuth: $needsAuth)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

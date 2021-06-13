//
//  Login.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 08.06.2021.
//

import SwiftUI

struct Login: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var account: Account
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("Email", text: self.$email)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            SecureField("Password", text: self.$password)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            Button("Log in") {
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
        }.padding(.horizontal, 30)
    }
}


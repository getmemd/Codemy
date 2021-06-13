//
//  Signup.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 08.06.2021.
//

import SwiftUI
import Moya

struct Signup: View {
    @State var firstName = ""
    @State var surname = ""
    @State var email = ""
    @State var username = ""
    @State var password = ""
    @State var passwordConfirm = ""
    @EnvironmentObject var account: Account
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("First name", text: self.$firstName)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            TextField("Surname", text: self.$surname)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            TextField("Email", text: self.$email)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            TextField("Username", text: self.$username)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            SecureField("Password", text: self.$password)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            SecureField("Confirm password", text: self.$passwordConfirm)
                .padding()
                .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))
            Button("Signup") {
                account.register(user: User(lastName: surname, firstName: firstName, fathersname: "", email: email, username: username, password: password))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(Capsule().stroke(Color.accentColor, lineWidth: 3))

        }.padding(.horizontal, 30)
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}

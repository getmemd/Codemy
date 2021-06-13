//
//  ProfileEditor.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 07.06.2021.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: User
    @Binding var presendetAsModal: Bool
    
    var body: some View {
        List {
            HStack {
                Text("Name").bold()
                Divider()
                TextField("Name", text: $profile.firstName)
            }
            HStack {
                Text("Surname").bold()
                Divider()
                TextField("Surname", text: $profile.lastName)
            }
            HStack {
                Text("Email").bold()
                Divider()
                TextField("Email", text: $profile.email)
            }
            Button("Save") {
                self.presendetAsModal = false
            }            
        }
        .padding()
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default), presendetAsModal: .constant(true))
    }
}

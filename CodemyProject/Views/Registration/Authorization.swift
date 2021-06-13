//
//  Authorization.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 08.06.2021.
//

import SwiftUI

struct Authorization: View {
    @Binding var needsAuth: Bool
    @State var isHidden = true
    @EnvironmentObject var account: Account
    
    var body: some View {
        VStack {
            Spacer()
            Image("codemyClear")
                .resizable()
                .frame(width: 250, height: 250)
            Spacer()
            ZStack {
                Login()
                    .opacity(isHidden ? 1 : 0)
                Signup()
                    .opacity(isHidden ? 0 : 1)
            }
            Spacer()
            Button("Already have an account?\nLog in") {
                isHidden.toggle()
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization(needsAuth: .constant(true))
            .environment(\.colorScheme, .dark)
    }
}

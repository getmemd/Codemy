//
//  ProfileSummary.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 07.06.2021.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: User
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var gridItemLayout = [GridItem(.adaptive(minimum: 50)), GridItem(.adaptive(minimum: 50))]
    
    init(profile: User) {
        self.profile = profile
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "person.fill")
                    .data(url: profile.avatar!)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                Text("\(profile.firstName) \(profile.lastName)")
                    .font(.title.bold())
                Text("email: \(profile.email)")
                Text("Swift programmer 👨🏻‍💻")
                    .padding(.bottom)
                Text("Achievments")
                    .font(.title2)
                LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 15, content: {
                    ForEach((0..<10), id: \.self) {
                        Image(systemName: symbols[$0 % symbols.count])
                            .resizable()
                            .padding(.all, 10)
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .center)
                            .overlay(Circle().stroke(Color.accentColor, lineWidth: 4))
                            .clipShape(Circle())
                    }
                })
                .padding(.horizontal)
            }
        }
    }
}

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: User.default)
    }
}

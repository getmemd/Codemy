//
//  DiscussionDetail.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 30.05.2021.
//

import SwiftUI

struct DiscussionDetail: View {
    @State var discussionTitle: String
    
    var body: some View {
        ScrollView {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In velit arcu, blandit id nisi nec, viverra sollicitudin odio. Mauris eu tempor nunc. Donec venenatis commodo ultrices. Vestibulum vitae urna faucibus, consectetur libero nec, tincidunt tellus. Nulla vel lacinia magna, non venenatis turpis. In eu ornare odio. Proin sit amet orci orci. Praesent tellus purus, consectetur non cursus vel, sollicitudin in velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam nec vehicula eros, sit amet bibendum ligula. In sit amet risus ultricies, sollicitudin urna id, sagittis dolor. Integer porta magna at pulvinar finibus.")
                .padding()
            HStack {
                Button("Like", action: { print("like") })
                    .padding()
                    .frame(width: .infinity, height: 30)
                    .background(Color.accentColor.opacity(0.8))
                    .cornerRadius(12)
                Spacer()
                Button("Dislike", action: { print("like") })
                    .padding()
                    .frame(width: .infinity, height: 30)
                    .background(Color.red.opacity(0.7))
                    .cornerRadius(12)
            }
            .foregroundColor(.black)
            .padding()
//            .frame(width: .infinity, height: 20)
        }
        .navigationTitle(discussionTitle)
    }
}

struct DiscussionDetail_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionDetail(discussionTitle: "Discussion")
    }
}

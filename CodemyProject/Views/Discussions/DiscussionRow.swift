//
//  DiscussionRow.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 29.05.2021.
//

import SwiftUI

struct DiscussionRow: View {
    @State var discussionTitle: String
    
    var body: some View {
        let tagCount = Int.random(in: 0...3)
        HStack {
            VStack {
                Image(systemName: "hand.thumbsup.fill")
                Image(systemName: "hand.thumbsdown")
                    .padding(.top)
            }
            .padding(.horizontal)
            VStack(alignment: .leading) {
                Text(discussionTitle)
                    .font(.title3)
                HStack {
                    if tagCount > 0 {
                        ForEach(0..<tagCount) { tag in
                            Text("tag \(tag)")
                                .padding(.horizontal)
                                .padding(.vertical, 3)
                                .background(Color.gray.opacity(0.4))
                                .clipShape(Capsule())
                        }
                        .padding(0.1)
                    } else {
                        Spacer()
                    }
                }
                Text(Date().description)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

struct DiscussionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiscussionRow(discussionTitle: "Sololearn")
            DiscussionRow(discussionTitle: "JavaScript")
        }
        .previewLayout(.sizeThatFits)
    }
}

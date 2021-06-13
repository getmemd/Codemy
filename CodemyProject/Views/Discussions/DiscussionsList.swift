//
//  DiscussionsList.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 29.05.2021.
//

import SwiftUI

struct DiscussionsList: View {
    let titles = ["Classes in python", "Problem in Obj-C", "How to program", "One day in IT", "Sololearn clone", "PirdorasBlog"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<15) { discussion in
                    NavigationLink(destination: DiscussionDetail(discussionTitle: titles.randomElement() ?? "")) {
                        DiscussionRow(discussionTitle: titles.randomElement() ?? "")
                    }
                }
            }
            .navigationTitle("Discussions")
        }
    }
}

struct DiscussionsList_Previews: PreviewProvider {
    static var previews: some View {
        DiscussionsList()
    }
}

//
//  HomeGrid.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 08.06.2021.
//

import SwiftUI

struct HomeGrid: View {
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        let xcoord = proxy.frame(in: .global).minX
        let diff = abs(xcoord - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        return scale
    }
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0..<20) { _ in
                            GeometryReader { proxy in
                                NavigationLink(
                                    destination: Image("cat")
                                        .resizable()
                                        .scaledToFill(),
                                    label: {
                                        VStack {
                                            let scale = getScale(proxy: proxy)
                                            Image("cat")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                )
                                                .clipped()
                                                .cornerRadius(5)
                                                .shadow(radius: 5)
                                                .scaleEffect(CGSize(width: scale, height: scale))
                                                .animation(.easeOut(duration: 0.5))
                                            Text("example")
                                                .padding(.top)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(.label))
                                        }
                                    })
                            }
                            .frame(width: 150, height: 150)
                        }
                    }.padding(32)
                }.navigationTitle("News")
                LazyVGrid(columns: [GridItem(.fixed(150)),
                                    GridItem(.fixed(150))], alignment: .center, spacing: 16, content: {
                                        ForEach(0..<15) { num in
                                            NavigationLink(
                                                destination: Image("cat")
                                                    .resizable()
                                                    .scaledToFill(),
                                                label: {
                                                    VStack {
                                                        Image("cat")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .cornerRadius(10)
                                                        Text("Block \(num)")
                                                    }
                                                })
                                        }
                                    })
            }
        }
    }
}

struct HomeGrid_Previews: PreviewProvider {
    static var previews: some View {
        HomeGrid()
    }
}

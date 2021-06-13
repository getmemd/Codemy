//
//  TextEditor.swift
//  CodemyProject
//
//  Created by Адиль Медеуев on 25.05.2021.
//

import SwiftUI

struct TextEditor: View {
    @State private var json =  """
        func Test(number: Int) {
            for i in 0...15 {
                print(number + i)
            }
        }
        """
    
    var body: some View {
        CodeViewer(
            content: $json,
            mode: .c_cpp,
            darkTheme: .solarized_dark,
            lightTheme: .solarized_dark,
            isReadOnly: false,
            isWrap: true,
            fontSize: 54
        )
            .onAppear {
                json = """
                func Test(number: Int) {
                    for i in 0...15 {
                        print(number + i)
                    }
                }
                """
            }
        
    }
}

struct TextEditor_Previews: PreviewProvider {
    static var previews: some View {
        TextEditor()
    }
}

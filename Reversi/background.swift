//
//  background.swift
//  Reversi
//
//  Created by David on 2023/9/17.
//

import SwiftUI

struct background: View {
    var body: some View {
        Image("backgroundpic")
            .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
            .resizable(resizingMode: .stretch)
            .ignoresSafeArea(edges: .all)
        
    }
}

struct background_Previews: PreviewProvider {
    static var previews: some View {
        background()
    }
}

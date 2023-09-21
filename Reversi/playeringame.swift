//
//  playeringame.swift
//  Reversi
//
//  Created by David on 2023/9/17.
//

import SwiftUI

struct playeringame: View {
    var body: some View {
            Image("Colormount")
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white,lineWidth:4)
                }
                .shadow(radius:20)
    }
}
struct playeringame_Previews: PreviewProvider {
    static var previews: some View {
        playeringame()
    }
}

//
//  playeringame2.swift
//  Reversi
//
//  Created by David on 2023/9/21.
//

import SwiftUI

struct playeringame2: View {
    var body: some View {
            Image("Colormount2")
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white,lineWidth:4)
                }
                .shadow(radius:20)
    }
}

#Preview {
    playeringame2()
}

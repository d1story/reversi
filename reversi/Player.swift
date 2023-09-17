//
//  Player.swift
//  reversi
//
//  Created by eric liu on 2023-09-17.
//

import Foundation

class Player{
    /// -1 is Black
    /// 1 is White
    var color:Int = 0
    /// The score of the player
    var score:Int = 0
    
    init(color:Int){
        self.color = color
    }
    
    /// Edward
    /// This returns a list of squares where there is a potential move
    /// [(x,y),(x,y) ....]
    func givePotientialMove(board:GameBoard)->[(Int,Int)]{
        return [(0,0)]
    }
    /// Tiffany
    /// This sweeps the board to check the score this player
    func checkScore(board:GameBoard)->Int{
        return 0
    }
    
}

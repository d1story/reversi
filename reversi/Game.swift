//
//  Game.swift
//  reversi
//
//  Created by eric liu on 2023-09-17.
//

import Foundation

class Game{
    var board = GameBoard()
    var timePerMove:Double = 30
    let p1 = Player(color:-1)
    let p2 = Player(color:1)
    var activePlayer:Player
    
    init(){
        self.activePlayer = p1
    }
    
    init(timePerMove:Double){
        self.activePlayer = p1
        self.timePerMove = timePerMove
    }
    /// Terrisa
    /// Checks if the one player has won the game
    func checkWin()->Bool{
        return false
    }
    
    /// Eric
    /// End a Players turn if they run out of time on their turn
    func timerPerMove()->Void{
        
    }
    
}

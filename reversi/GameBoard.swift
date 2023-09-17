//
//  GameBoard.swift
//  reversi
//
//  Created by eric liu on 2023-09-17.
//

import Foundation

struct GameBoard{
    /// This stores the current state of the board
    /// Note that:
    ///     0 is no piece,
    ///     -1 is Black,
    ///     1 is White,
    var currentBoard:[[Int]] = Array(repeating:(Array(repeating:0,count:8)),count:8)
    /// Alysa
    /// This updates the gameboard
    func update()->Void{
        
    }
    /// Stephany
    /// This check if a move is valid
    func checkValid()->Bool{
        return false
    }
    /// Serena
    /// This updates the
    func flip()->Void {
        
    }
}

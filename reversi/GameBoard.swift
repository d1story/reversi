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
    func update(move: Array, color: Int)-> Bool{
        """
        Update currentBoard and return True if the move is a valid move. Otherwise return false.

        move: an array [x, y], x is row number from 0 to 7 and y is column number from 0 to 7.
        color: -1 or 1, represents Black / White
        """
        if self.checkValid(move){
            self.flip(move, color)
            self.placeMove(move, color)
            return true
        } else {
            return false
        }
    }

    private func placeMove(move: Array, color: Int) -> Void{
        """
        Helper function for update.

        move: an array [x, y], x is row number from 0 to 7 and y is column number from 0 to 7.
        color: -1 or 1, represents Black / White
        """
        var x = move[0]
        var y = move[1]
        self.currentBoard[x][y] = color
    }

    /// Stephany
    /// This check if a move is valid
    func checkValid(move: Array)->Bool{
        """
        Check if a move is a valid move.

        move: an array [x, y], x is row number from 0 to 7 and y is column number from 0 to 7.
        """
        return false
    }
    /// Serena
    /// This updates the
    func flip(move: Array, color: Int)->Void {
        """
        Flip the currentBoard, given move.

        move: an array [x, y], x is row number from 0 to 7 and y is column number from 0 to 7.
        color: -1 or 1, represents Black / White
        """
        
    }
}

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

    /// Stephanie
    /// This check if a move is valid
    
    // Check if outside of board
    func positionInBounds(n: Int, row: Int, col: Int) -> Bool {
        // int n here is just 8
        return row >= 0 && row < n && col >= 0 && col < n
    }

    // Check if it could move in a certain direction
    func checkLegalInDirection(board: [[Int]], n: Int, row: Int, col: Int, colour: Int, deltaRow: Int, deltaCol: Int) -> Bool {
        // 0 means empty, -1 means black, 1 means white
        if board[row][col] == 0 {
            let newRow = row + deltaRow
            let newCol = col + deltaCol
            
            if positionInBounds(n: n, row: newRow, col: newCol) && board[newRow][newCol] == -colour {
                var rowIndex = newRow + deltaRow
                var colIndex = newCol + deltaCol
                
                while positionInBounds(n: n, row: rowIndex, col: colIndex) && board[rowIndex][colIndex] == -colour {
                    rowIndex += deltaRow
                    colIndex += deltaCol
                }
                
                if positionInBounds(n: n, row: rowIndex, col: colIndex) && board[rowIndex][colIndex] == colour {
                    return true
                }
            }
        }
        return false
    }

    // Check if legal move
    func checkValid(board: [[Int]], n: Int, row: Int, col: Int, colour: Int) -> Bool {
        let directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
        
        for direction in directions {
            let (deltaRow, deltaCol) = direction
            if checkLegalInDirection(board: board, n: n, row: row, col: col, colour: colour, deltaRow: deltaRow, deltaCol: deltaCol) {
                return true
            }
        }
        
        return false
    }
    
    
    """
    Below is what Eric wrote initially for checkValid func
    In case I need to modify my part for consistency with others
    
    func checkValid(move: Array)->Bool{
        
        Check if a move is a valid move.

        move: an array [x, y], x is row number from 0 to 7 and y is column number from 0 to 7.
        
        return false
    }
    
    """
    
    
    
    /// Serena
    /// This updates the
    func flip(
    boardName: inout [[Int]],
    row: Int,
    col: Int,
    n: Int,
    color: Int,
    checkLegalInDirection: (inout [[Int]], Int, Int, Int, Int, Int, Int) -> Bool,
    positionInBounds: (Int, Int, Int) -> Bool
) {
    let deltaRow = [-1, -1, -1, 0, 0, 1, 1, 1]
    let deltaCol = [-1, 0, 1, -1, 1, -1, 0, 1]
    
    var oppositeColor = -1
    
    if color == 1 {
        oppositeColor = -1
    } else {
        oppositeColor = 1
    }
    
    boardName[row][col] = color
    
    for i in 0..<8 {
        var actualRow = row + deltaRow[i]
        var actualCol = col + deltaCol[i]
        
        if checkLegalInDirection(&boardName, n, row, col, color, deltaRow[i], deltaCol[i]) {
            while boardName[actualRow][actualCol] == oppositeColor && positionInBounds(n, actualRow, actualCol) {
                boardName[actualRow][actualCol] = color
                actualRow += deltaRow[i]
                actualCol += deltaCol[i]
            }
        }
    }
}
}

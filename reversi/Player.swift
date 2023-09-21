//
//  Player.swift
//  reversi
//
//  Created by eric liu on 2023-09-17.
//  Edited Sept. 18th (Edward)
//


import Foundation
let WHITE = 1
let BLACK = -1
let EMPTY = 0


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
        var numOfAvailMove:int = 0
        var arr = [[Int]]()
        let n:int = 8
        for row in 0..<n{
            for col in 0..<n{
                if (board[row][col] == EMPTY){
                    if (checkLegalInDirection(board,n,row,col,colour,-1,-1) || checkLegalInDirection(board,n,row,col,colour,-1,0) || checkLegalInDirection(board,n,row,col,colour,-1,1) || checkLegalInDirection(board,n,row,col,colour,0,-1) || checkLegalInDirection(board,n,row,col,colour,0,1) || checkLegalInDirection(board,n,row,col,colour,1,-1) || checkLegalInDirection(board,n,row,col,colour,1,0) || checkLegalInDirection(board,n,row,col,colour,1,1)){
                        arr[numOfAvailMove][0] = row
                        arr[numOfAvailMove][1] = col
                        numOfAvailMove+=1
                }
                }
            }
        }


        return arr
    }
    /// Tiffany
    /// This sweeps the board to check the score this player
    
    func checkScore(board: GameBoard) -> Int {
        var playerScore = 0
        
        for row in 0..<board.count {
            for col in 0..<board[row].count {
                if board[row][col] == color {
                    playerScore += 1
                }
            }
        }
        
        score = playerScore
        return playerScore
    }

"""
    Below is what Eric originally wrote:

        func checkScore(board:GameBoard)->Int{
            return 0
        }
       
    }
"""



func checkLegalInDirection(board:GameBoard, n:int, row:int, col:int, colour:int, deltaRow:int, deltaCol:int) -> bool{
    var isLegal:bool = false
    var numOfDelta:int = 1
    if (!positionInBounds(n,row,col)||!positionInBounds(n,row+deltaRow,col+deltaCol)){
        isLegal = false
    }
    if (colour == WHITE){
        if (board[row+deltaRow][col+deltaCol] != BLACK ){
            isLegal = false
        } else{
            while(positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == BLACK ){
                //it should first check one increment, which based on above condition, should always have B
                //we check the next within the while loop so it doesn't conflict with looping condition
                numOfDelta += 1 //so first increment delta
                if (positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == BLACK ){
                    continue
                } else if (positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == EMPTY ){
                    //this means it reached blank first so not legal move
                    isLegal = false
                    break
                } else if (positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == WHITE){//supposedly is white
                    isLegal = true
                    break
                }


                }


             }
    } else {
        if (board[row+deltaRow][col+deltaCol] != WHITE){
            isLegal = false
        } else{//while it is still white or when it reaches blank but not change colour
            while(positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == WHITE){
                //it should first check one increment, which based on above condition, should always have B
                //we check the next within the while loop so it doesn't conflict with looping condition
                numOfDelta+=1 //so first increment delta
                if (positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == WHITE){
                    continue
                } else if (positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == EMPTY){
                    //this means it reached blank first
                    isLegal = false
                    break
                } else if (positionInBounds(n,row+numOfDelta*deltaRow,col+numOfDelta*deltaCol) && board[row+numOfDelta*deltaRow][col+numOfDelta*deltaCol] == BLACK){//supposedly is black
                    isLegal = true
                }


            }
        }


    }
    return isLegal
}
func positionInBounds(n:int,row:int,col:int) -> bool{
    if (row < n && col < n && row >= 0 && col >= 0){
        return true
    } else {
        return false
    }
}


//
//  model.swift
//  assign1
//
//  Created by Ethan  Xu on 2/21/21.
//
 
import Foundation
 
class Triples {
    var board: [[Int]]
    
    init(){
       board = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
    }
 
    func newgame() {
        board = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
    }                   // re-inits 'board', and any other state you define
    func rotate() {
        board = rotate2DInts(input: board)
    }                    // rotate a square 2D Int array clockwise
    
    func shift() {
        var prev: Int
        var curr: Int
        
        for row in 0...(board.count - 1){
            for column in 1...(board.count - 1) {
                prev = board[row][column - 1]
                curr = board[row][column]
                
                if (prev == curr && curr != 2){
                    board[row][column - 1] = curr * 2
                    board[row][column] = 0
                } else if (prev + curr == 3) {
                    board[row][column - 1] = 3
                    board[row][column] = 0
                } else if (prev == 0) {
                    board[row][column - 1] = curr
                    board[row][column] = 0
                }
            }
            }
    }
    
    func collapse(dir: Direction){      // collapse in specified direction using shift() and rotate()
        switch dir {
        case .left:
            shift()
        
        case .right:
            rotate()
            rotate()
            shift()
            rotate()
            rotate()
        
        case .down:
            rotate()
            shift()
            rotate()
            rotate()
            rotate()
        
        case .up:
            rotate()
            rotate()
            rotate()
            shift()
            rotate()
    
        }
    }
}

enum Direction {
    case left
    case right
    case down
    case up
}
 
// class-less function that will return of any square 2D Int array rotated clockwise
public func rotate2DInts(input: [[Int]]) -> [[Int]] {
    var new_board: [[Int]] = []
    var temp_arr: [Int] = []
    
    for column in 0...(input.count - 1){
        temp_arr.removeAll()
        
        for row in 0...(input.count - 1){
            temp_arr.insert(input[row][column], at: 0)
        }
        new_board.append(temp_arr)
    }
    return new_board

}
 
public func rotate2D<T>(input: [[T]]) -> [[T]] {
    var new_board: [[T]] = []
    var temp_arr: [T] = []
    
    for column in 0...(input.count - 1){
        temp_arr.removeAll()
        
        for row in 0...(input.count - 1){
            temp_arr.insert(input[row][column], at: 0)
        }
        new_board.append(temp_arr)
    }
    return new_board
}

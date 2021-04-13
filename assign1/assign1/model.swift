//
//  model.swift
//  assign1
//
//  Created by Ethan  Xu on 2/21/21.
//
 
import Foundation
import SwiftUI
 
class Triples: ObservableObject {
    @Published var board: [[Int]]
    @Published var score: Int
    private var generator = SystemRandomNumberGenerator()
    private var seeded = SeededGenerator(seed: 14)
    private var is_random: Bool
    @Published var game_type: Bool
    
    init(){
        board = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
        score = 0
        is_random = false
        game_type = false
    }
 
    func newgame() {
        board = [[0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0]]
        score = 0
        seeded = SeededGenerator(seed: 14)
        if(game_type) {is_random = true} else {is_random = false}
    }                   // re-inits 'board', and any other state you define
    func rotate() {
        board = rotate2DInts(input: board)
    }                    // rotate a square 2D Int array clockwise
    
    func shift() -> Bool {
        var prev: Int
        var curr: Int
        var modified: Bool = false
        
        for row in 0...(board.count - 1){
            for column in 1...(board.count - 1) {
                prev = board[row][column - 1]
                curr = board[row][column]
                
                if (prev == curr && curr != 2 && curr != 1){
                    board[row][column - 1] = curr * 2
                    board[row][column] = 0
                    score += (curr * 2)
                    modified = true
                } else if (prev + curr == 3) {
                    board[row][column - 1] = 3
                    board[row][column] = 0
                    score += 3
                    modified = true
                } else if (prev == 0) {
                    board[row][column - 1] = curr
                    board[row][column] = 0
                    modified = true
                }
            }
            }
        
        return modified
    }
    
    func collapse(dir: Direction) -> Bool{      // collapse in specified direction using shift() and rotate()
        var modified: Bool = false
        
        switch dir {
        case .left:
            modified = shift()
        
        case .right:
            rotate()
            rotate()
            modified = shift()
            rotate()
            rotate()
        
        case .down:
            rotate()
            modified = shift()
            rotate()
            rotate()
            rotate()
        
        case .up:
            rotate()
            rotate()
            rotate()
            modified = shift()
            rotate()
    
        }
        
        if(modified) {spawn()}
        return modified
    }
    
    func spawn() {
        var val:Int
        var location:Int
        var open_spots: [[Int?]] = [[nil, nil, nil, nil],
                                    [nil, nil, nil, nil],
                                    [nil, nil, nil, nil],
                                    [nil, nil, nil, nil]]
        var count: Int = 0
        
        for row in 0...3 {
            for col in 0...3 {
                if(board[row][col] == 0){
                    open_spots[row][col] = count
                    count += 1
                }
            }
        }
        
        if(count == 0){print("happens"); return}
        
        if(is_random) {
            val = getRandomVal()
            location = getRandomLoc(count: (count - 1))
        } else {
            val = getDeterminedVal()
            location = getDeterminedLoc(count: (count - 1))
        }
        
        score += val
        insert(val: val, location: location, open_spots: open_spots)
    }
    
    func insert(val: Int, location: Int, open_spots: [[Int?]]) {
        for row in 0...3 {
            for col in 0...3 {
                if((open_spots[row][col] ?? -1) == location){
                    board[row][col] = val
                    return
                }
            }
            print()
        }
    }
    
    func getDeterminedVal() -> Int{
        let val = Int.random(in: 1...2, using: &seeded)
        return val
    }

    func getDeterminedLoc(count: Int) -> Int{
        let newRandomNumber = Int.random(in: 0...count, using: &seeded)
        return newRandomNumber
    }

    func getRandomVal() -> Int{
        var generator = SystemRandomNumberGenerator()
        let newRandomNumber = Int.random(in: 1...2, using: &generator)
        return newRandomNumber
    }

    func getRandomLoc(count: Int) -> Int{
        let newRandomNumber = Int.random(in: 0...count, using: &generator)
        return newRandomNumber
    }
    
    func print_board() {
        print()
        for row in 0...3 {
            for col in 0...3 {
                print("\(board[row][col]) ", terminator:"")
            }
            print()
        }
    }


} // END TRIPLES ------------------------------------

struct Tile {
    var val: Int
    var id: Int
    var row: Int
    var col: Int
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

//
//  36.ValidSudoku.swift
//  LeetCode
//
//  Created by Tomona Sako on 2020/09/01.
//  Copyright © 2020 Tomona Sako. All rights reserved.
//

import Foundation



func isValidSudoku(_ board: [[Character]]) -> Bool {
    var check = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10), count: 3)
    var result = true
    for c in 0...8 {
        for r in 0...8 {
            if !helperSquare(board, check: &check, c: c, r: r) || !helperStraight(board, check: &check, c: c, r: r) {
                return false
            }
        }
    }
    
    return true
}

func helperSquare(_ board: [[Character]], check: inout [[[Int]]], c: Int, r: Int) -> Bool {
    // 1 2 3
    // 4 5 6
    // 7 8 9
    // check[2] = Square
    // check[1][1] = left top
    
    func returnTheBoxNum (c: Int, r: Int) -> Int {
        let box = [[1,2,3],[4,5,6],[7,8,9]]
        let row = r / 3
        let column = c / 3
        return box[row][column]
    }
    
    if board[c][r] != "." {
        let box = returnTheBoxNum(c: c, r: r)
        let n = Int(String(board[c][r]))!
        if check[2][box][n] == 1 {
            print("square")
            return false
        } else {
            check[2][box][n] += 1
        }
    }
    return true
}

func helperStraight(_ board: [[Character]], check: inout [[[Int]]], c: Int, r: Int) -> Bool {
    if board[c][r] != "." {
        let n = Int(String(board[c][r]))!
        if check[0][r][n] == 1 || check[1][c][n] == 1 {
            print("straight")
            return false
        }
        check[0][r][n] += 1
        check[1][c][n] += 1
    }
    return true
}

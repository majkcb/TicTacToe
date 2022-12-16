//
//  Board.swift
//  TicTacToe
//
//  Created by Michael Bergsten on 2022-12-16.
//

import UIKit

class Board {
    
    var position: [Int] = []
    var move: Int?
    
    init(position: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]) {
        self.position = position
        self.move = position.randomElement()
    }
    
    

}



//
//  BullseyeGameManager.swift
//  Bullseye 1
//
//  Created by Ilmhona 10 on 20/09/24.
//

import Foundation

class BullseyeGameManager {
    var targetNumber: Int
    var score: Int
    var round: Int
    
    init() {
        self.targetNumber = Int.random(in: 1...100)
        self.score = 0
        self.round = 1
    }
    
    func didWinTheGame() {
        targetNumber = Int.random(in: 1...100)
        score += 100
        round += 1
    }
    
    func didLoseTheGame () {
       targetNumber = Int.random(in: 1...100)
        score = 0
        round += 1
           }
    
//    func updateAfterTen() {
//        targetNumber = Int.random(in: 1...100)
//        score += 200
//        round += 1
//    }
}

//
//  Model.swift
//  Squares
//
//  Created by Дмитрий Процак on 30.03.2023.
//

import UIKit

struct Cell {
    let height: Int
    let color: UIColor
}

struct Source {
    static func makeRandomSquare() -> [Cell] {
        var randonArray: [Cell] = []
        
        for _ in 0...5 {
            randonArray.append(Cell(height: Int.random(in: 100...500), color: UIColor.random()))
        }
        return randonArray
    }
}





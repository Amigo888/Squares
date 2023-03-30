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
        
        let colors = DataManager.shared.colors.shuffled()
        let heights = DataManager.shared.heigts.shuffled()
        
        for index in 0..<colors.count {
            let cell = Cell(height: heights[index], color: colors[index])
            
            randonArray.append(cell)
        }
        return randonArray
    }
}



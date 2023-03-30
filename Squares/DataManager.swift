//
//  DataManager.swift
//  Squares
//
//  Created by Дмитрий Процак on 30.03.2023.
//

import UIKit

class DataManager {
     static let shared = DataManager()
    
    private init() {}
    
    let colors = [UIColor.brown,
                  UIColor.red,
                  UIColor.yellow,
                  UIColor.blue,
                  UIColor.brown,
                  UIColor.green,
                  UIColor.gray,
                  UIColor.purple]
    
    let heigts = [200,250,300,350,280,500,270,310]
}

//
//  Store.swift
//  SpaceDungeon
//
//  Created by 90303107 on 12/11/2561 BE.
//  Copyright © 2561 BE 64911. All rights reserved.
//

import UIKit

class Store {
    private var startPoint: CGPoint
    private var thing = CGPoint(x: 0, y: 0)
    
    init(start: CGPoint){
        startPoint = start
    }
    func savePoint(point: CGPoint) {
        startPoint = point
    }
    
    func getPoint() -> CGPoint {
        return startPoint
    }
    
    func saveSpritePoint(point: CGPoint) {
        thing = point
    }
    
    func getSpritePoint() -> CGFloat {
        return thing.x
    }
}

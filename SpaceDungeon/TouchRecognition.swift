//
//  TouchRecognition.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/5/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit

class TouchRecognizer{

    private var swipeDirection = ""
    private var swipeDistance = 0
    private var touchStartPoint: CGPoint(x: 0)
    private var touchEndPoint = CGPoint(x: 0, y: 0)
    
    init(start: CGPoint){
        touchStartPoint = start
    }
    
}

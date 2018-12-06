//
//  StaticBackgroundObject.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/6/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class StaticBackgroundObject{
    
    var objectImage : SKSpriteNode
    var xPos : Int
    var yPos : Int
    var zPos : Int
    
    init (img: String, x: Int , y: Int, z: Int){
        
        objectImage = SKSpriteNode(imageNamed: img)
        xPos = x
        yPos = y
        zPos = z
        
    }
    

}

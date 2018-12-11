//
//  scoreTracker.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/6/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class scoreTracker {
    
    private var currentscore : SKLabelNode
    var xPos : Int
    var yPos : Int
    var zPos : Int
    
    init (score: Int, x: Int , y: Int, z: Int, font: String, fontsize: Int){
        
        currentscore = SKLabelNode(text: "\(score)")
        currentscore.fontSize = CGFloat(fontsize)
        currentscore.fontName = font
        xPos = x
        yPos = y
        zPos = z
        
    }
    
    func setEnviornment(env: GameScene){
        env.addChild(currentscore)
        currentscore.position.x = CGFloat(xPos)
        currentscore.position.y = CGFloat(yPos)
        currentscore.zPosition = CGFloat(zPos)
    }
    
    func updateScore(updatedScore: Int){
        currentscore.text = "\(updatedScore)"
    }
    
}

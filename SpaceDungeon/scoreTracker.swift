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
    
    var currentscore : SKLabelNode
    private var score = 0
    var xPos : Int
    var yPos : Int
    var zPos : Int
    
    init (score: Int, x: Int , y: Int, z: Int, font: String, fontsize: Int){
        
        currentscore = SKLabelNode(text: "\(score)")
        currentscore.fontSize = CGFloat(fontsize)
        currentscore.fontName = font
        currentscore.fontColor = .black
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
        score = updatedScore
        currentscore.text = "\(score)"
    }
    func addOne() {
        currentscore.text = "\(score + 1)"
        score = score + 1
    }
    func getLabel()-> SKLabelNode {
        return currentscore
    }
    func changePosition(pos: CGPoint){
        currentscore.position.x = -Dimensions().screenWidth/2 + 58
        currentscore.position.y = Dimensions().screenHeight/2 - 63
        currentscore.zPosition = 21
    }
}

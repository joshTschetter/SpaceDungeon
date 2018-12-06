//
//  Player.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/5/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class Player{

    var image: SKSpriteNode
    var xPos: Int
    var yPos: Int
    var Zpos: Int
    var startX = 0
    var startY = 0
    var endX = 0
    var endY = 0
    
    init(img: String, pos: CGPoint, depth: Int){
        
            image = SKSpriteNode(imageNamed: img)
            xPos = Int(pos.x)
            yPos = Int(pos.y)
            Zpos = depth
            image.zPosition = CGFloat(depth)
            image.position = pos
        
    }
    
    func addToEnviornment(env: GameScene){
        env.addChild(self.image)
    }
    func setStartTouch(location: CGPoint){
        startX = Int(location.x)
        startY = Int(location.y)
    }
    func setEndTouch(location: CGPoint){
        endX = Int(location.x)
        endY = Int(location.y)
    }
    
    func move(){
        print(startX)
        print(startY)
        print(endX)
        print(endY)
        
    }
    
    
}

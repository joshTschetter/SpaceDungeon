//
//  Background.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/5/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class Background{
    
    var backgrounds = [SKSpriteNode]()
    var staticObjects = [StaticBackgroundObject]()
    
    init(){
        
        var bgOne = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgOne)
        var bgTwo = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgTwo)
        var bgThree = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgThree)
        var bgFour = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgFour)
        var bgFive = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgFive)
        var bgSix = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgSix)
        var bgSeven = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgSeven)
        var bgEight = SKSpriteNode(imageNamed: "bg")
        backgrounds.append(bgEight)
        
        
        var levelOneStatues = StaticBackgroundObject(img: "statue", x: 0, y: 69, z: 2)
        staticObjects.append(levelOneStatues)
    }
    
    func addBackground(env: GameScene){
        
        var counter = 0
        for item in backgrounds {
            
            env.addChild(item)
            item.position.x = 0
            item.position.y = CGFloat(0 + 809 * counter)
            item.zPosition = 1
            
            counter = counter + 1
        }
        
        for item in staticObjects{
            env.addChild(item.objectImage)
            item.objectImage.position.x = CGFloat(item.xPos)
            item.objectImage.position.y = CGFloat(item.yPos)
            item.objectImage.zPosition = CGFloat(item.zPos)
        }
        
    }
    
    func dynamicBackground(){
        for item in backgrounds {
            var moveAction = SKAction.moveTo(y: CGFloat(item.position.y - 400), duration: TimeInterval(1))
            item.run(moveAction)
            item.position.y = item.position.y
            
           
        }
        
    }
    
    
    func removeStaticObjects(){
        for item in staticObjects {
            item.objectImage.removeFromParent()
        }
    }
    
    
    
}

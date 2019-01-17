//
//  StaticBackgroundObject.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/6/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class BackgroundObject{
    
    var objectImages : SKSpriteNode
    var xPos : Int
    var yPos : Int
    var zPos : Int
    var endxPos : Int
    var endyPos : Int
    var moves : Bool
    var movespeed : Int
    var animated : Bool
    init (img: String, x: Int , y: Int, z: Int){
        
        objectImages = (SKSpriteNode(imageNamed: img))
        let f0 = SKTexture.init(imageNamed: "city1")
        let f1 = SKTexture.init(imageNamed: "city2")
        let f2 = SKTexture.init(imageNamed: "city3")
        let f3 = SKTexture.init(imageNamed: "city4")
        let f4 = SKTexture.init(imageNamed: "city5")
        let frames: [SKTexture] = [f0, f1, f2, f3, f4]
        
        // Load the first frame as initialization
       objectImages = SKSpriteNode(imageNamed: img)
        objectImages.size.width = Dimensions().screenWidth
        objectImages.size.width = Dimensions().screenHeight
       objectImages.position = CGPoint(x: 0, y: -200)
        
        // Change the frame per 0.2 sec
        let animation = SKAction.animate(with: frames, timePerFrame: 0.2)
        objectImages.run(SKAction.repeatForever(animation))

        xPos = x
        yPos = y
        zPos = z
        endxPos = x
        endyPos = y
        moves = false
        movespeed = 0
        animated = false
    }
    init (img: String, x: Int , y: Int, isanimated: Bool){
        objectImages = SKSpriteNode(imageNamed: img)
        objectImages.zPosition = 5
        xPos = x
        yPos = y
        zPos = 0
        endxPos = x
        endyPos = y
        moves = false
        movespeed = 0
        animated = isanimated
        
    }
    init (img: String, x: Int , y: Int , z: Int , xDestination: Int, yDestination: Int, speed: Int){
        objectImages = (SKSpriteNode(imageNamed: img))
        xPos = x
        yPos = y
        zPos = z
        objectImages.zPosition = CGFloat(zPos)
        endxPos = xDestination
        endyPos = yDestination
        moves = true
        movespeed = speed
        animated = false
    }
    
    func moveifcan (){
//        if moves {
//            var moveAction = SKAction.moveBy(x: CGFloat(self.endxPos), y: CGFloat(self.endyPos), duration: TimeInterval(self.movespeed))
//                objectImages.run(moveAction)
//            
//            
//        }
    }
    
    

}

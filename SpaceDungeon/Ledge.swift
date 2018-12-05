//
//  Ledge.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/20/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit

class Ledge {
    
    /////////////////////////
    
    var xPos : Int
    var sprite : SKSpriteNode
    var yPos : Int
    
    ////////////////////////
    
    init(x: Int, y: Int, img: String  ){
        self.xPos = x
        sprite = SKSpriteNode(imageNamed: img)
        self.yPos = y
    }
    
    ////////////////////////
    //GETTERS//////////////
    
    func getSprite()-> SKSpriteNode {
        return self.sprite
    }
    
    func getYpos()-> Int {
        return self.yPos
    }
    
   
    
    func getXpos()-> Int {
        return self.xPos
    }
    
 
    /////////////////////////
    //SETTERS////////////////
    
    func setYpos(y: Int){
        self.yPos = y
    }
    
    func setXpos(x: Int){
        self.xPos = x
    }
    
    ////////////////////////
    //UTILITY//////////////
    
    func moveX(x: Int){
        self.sprite.position.x = CGFloat(x)
    }
    
    func moveY(y: Int){
        self.sprite.position.y = CGFloat(y)
    }
}

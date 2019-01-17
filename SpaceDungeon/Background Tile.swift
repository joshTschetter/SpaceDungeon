//
//  Background Tile.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/11/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class BackgroundTile {
    
    private var yPosition = 0
    var Tile = [SKSpriteNode]()
    private var movementSpeed : Int
    
    init(images: [String], speed: Int) {
        
        for item in images {
            let newSprite = SKSpriteNode(imageNamed: item)
            newSprite.size.width = Dimensions().screenWidth
            newSprite.size.height = Dimensions().screenHeight
            Tile.append(newSprite)
        }
        movementSpeed = speed

    }
    func addImage(img: String){
        Tile.append(SKSpriteNode(imageNamed: img ))
    }
    func getSprites()-> [SKSpriteNode]{
        return Tile
    }
    func setYpos(y: Int){
        yPosition = y
    }
    func getYpos()-> Int {
        return yPosition
    }
    
}

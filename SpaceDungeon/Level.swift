//
//  Level.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/24/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class Level {
    
    private var Ledges : [Ledge]
    private var ledgeImage: String
    private var xPositions : [Int]
    private var yPositions : [Int]
    
    init (ledgeAmt: Int, Difficulty: Int, ledgeSprite: String){
        ledgeImage = ledgeSprite
        Ledges = [Ledge]()
        xPositions = [Int]()
        yPositions = [Int]()
        
        for number in (0 ... ledgeAmt){
            
            let one =  Int.random(in: 5 ... 5 + Difficulty)
            
            /////LEFT LEDGES///////////////////////////////////////////////////////////////////////
            if number % 2 == 0 {
                Ledges.append(Ledge(x: -350 + one * 30 , y: 1000 + 550 * number, img: ledgeSprite))
                Ledges[number].moveX(x: Ledges[number].getXpos())
                Ledges[number].moveY(y: Ledges[number].getYpos())
            }
            /////RIGHT LEDGES/////////////////////////////////////////////////////////////////////
            else {
                Ledges.append(Ledge(x: 350 - one * 30 , y: 1000 + 550 * number, img: ledgeSprite))
                Ledges[number].moveX(x: Ledges[number].getXpos())
                Ledges[number].moveY(y: Ledges[number].getYpos())
            }
            
            
            xPositions.append(Int(Ledges[number].getXpos()))
            yPositions.append(Int(Ledges[number].getYpos()))
            
            
        
        }
        
    }
    
    func addLevelLedges(env: GameScene){
        for item in Ledges {
            env.addChild(item.getSprite())
        }
        
    }
    func update(){
        for item in Ledges {
            var moveAction = SKAction.moveTo(y: CGFloat(item.getYpos() - 400), duration: TimeInterval(1))
            item.getSprite().run(moveAction)
            item.setYpos(y: Int(item.getSprite().position.y))
            item.getSprite().zPosition = 3
           
        }
        
    }
    func optimize(){
        for item in Ledges {
            if item.getSprite().position.y < -700 {
                item.getSprite().removeFromParent()
            }
        }
    }
    func levelDone ()-> Bool {
        if Ledges[Ledges.count - 1].getSprite().position.y > -300 {
            return false
        }
        else {
            return true
           
        }
        
    }
   
    func clearLedges(){
        for item in Ledges {
            item.getSprite().removeFromParent()
        }
    }
}

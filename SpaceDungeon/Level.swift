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
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var Ledges : [Ledge]
    private var ledgeImage: String
    private var xPositions : [Int]
    private var yPositions : [Int]
    
    init (ledgeAmt: Int, Difficulty: Int, ledgeSprite: String){
        ledgeImage = ledgeSprite
        Ledges = [Ledge]()
        xPositions = [Int]()
        yPositions = [Int]()
        
        for number in (0 ... ledgeAmt){
            
            let one =  Int.random(in: 9 ... 9 + Difficulty)
            
            /////LEFT LEDGES///////////////////////////////////////////////////////////////////////
            if number % 2 == 0 {
                Ledges.append(Ledge(x: 0 - Int(screenWidth)/2 + one * Int(screenWidth)/Int(10) , y: 1000 + 550 * number, img: ledgeSprite))
                Ledges[number].moveX(x: Ledges[number].getXpos())
                Ledges[number].moveY(y: Ledges[number].getYpos())
            }
            /////RIGHT LEDGES/////////////////////////////////////////////////////////////////////
            else {
                Ledges.append(Ledge(x: 0 + Int(screenWidth)/2 - one * Int(screenWidth)/Int(10) , y: 1000 + 550 * number, img: ledgeSprite))
                Ledges[number].moveX(x: Ledges[number].getXpos())
                Ledges[number].moveY(y: Ledges[number].getYpos())
            }
            
            
            xPositions.append(Int(Ledges[number].getXpos()))
            yPositions.append(Int(Ledges[number].getYpos()))
            
            
        
        }
        
    }
    init (ledgeAmt: Int, Difficulty: Int, ledgeSprite: [String]){
        ledgeImage = ledgeSprite[0]
        Ledges = [Ledge]()
        xPositions = [Int]()
        yPositions = [Int]()
        
        for number in (0 ... ledgeAmt){
            
            let one =  Int.random(in: 3 ... 2 + Difficulty)
            
            /////LEFT LEDGES///////////////////////////////////////////////////////////////////////
            if number % 2 == 0 {
                Ledges.append(Ledge(x:  0 - Int(screenWidth)/2 + 280 + (30 * one) , y: 1000 + 550 * number, img: ledgeSprite[0]))
                Ledges[number].moveX(x: Ledges[number].getXpos())
                Ledges[number].moveY(y: Ledges[number].getYpos())
            }
           else if number % 3 == 0 {
                if Difficulty > 25 {
                    Ledges.append(Ledge(x: -1000, y: 1000 + 550 * number, img: ledgeSprite[2]))
                    print(Difficulty)
                    Ledges[number].moveX(x: Ledges[number].getXpos())
                    Ledges[number].moveY(y: Ledges[number].getYpos())
                    
                }
                else{
                Ledges.append(Ledge(x: 0, y: 1000 + 550 * number, img: ledgeSprite[2]))
                Ledges[number].moveX(x: Ledges[number].getXpos())
                Ledges[number].moveY(y: Ledges[number].getYpos())
                Ledges[number].getSprite().size.width = Dimensions().screenWidth - 175
                }
            }
                /////RIGHT LEDGES///////////////p//////////////////////////////////////////////////////
            else {
                Ledges.append(Ledge(x:
                    0 + Int(screenWidth)/2 - 280 - (30 * one) , y: 1000 + 550 * number, img: ledgeSprite[1]))
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
            let moveAction = SKAction.moveTo(y: CGFloat(item.getYpos() - 80), duration: TimeInterval(0.06125))
            item.getSprite().run(moveAction)
            item.setYpos(y: Int(item.getSprite().position.y))
            item.getSprite().zPosition = 3
           
        }
        
    }
    func optimize(){
        for item in Ledges {
            if item.getSprite().position.y < 0 - screenHeight/2 - 50 {
                item.getSprite().removeFromParent()
            }
        }
    }
    func levelDone ()-> Bool {
        if Ledges[Ledges.count - 1].getSprite().position.y > 0 - screenHeight/2  {
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
    func ledgePositions()-> [CGPoint]{
        var newPositionArray = [CGPoint]()
        for number in 0 ... Ledges.count - 1 {
            let newCGPoint = CGPoint(x: xPositions[number], y: yPositions[number])
            newPositionArray.append(newCGPoint)
        }
        
        return newPositionArray
    }
    func getLedgeWidth()-> CGFloat {
        return Ledges[0].getSprite().size.width
    }
    func getLedgeHeight()-> CGFloat {
        return Ledges[0].getSprite().size.height
    }
}

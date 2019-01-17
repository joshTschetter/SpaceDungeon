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
    
    private var sprite: SKSpriteNode
    private var pos: CGPoint
    private var touchPoint = CGPoint(x: 0, y: 0)
    private var releasePoint = CGPoint(x: 0, y: 0)
    
    init(img: String) {
        sprite = SKSpriteNode(imageNamed: img)
        pos = CGPoint(x: 0, y: -150)
        sprite.position = pos
        sprite.zPosition = 5
 
        
    }
    
    func addToEnvironment(env: GameScene) {
        env.addChild(sprite)
    }
    
    func getSprite() -> SKSpriteNode {
        return sprite
    }
    
    func findXDifference(end: CGPoint, start: CGPoint) -> CGFloat {
        let difference = end.x - start.x
        return difference
    }
    
    func xPos() -> CGFloat {
        return getSprite().position.x
    }
    func yPos() -> CGFloat {
        return getSprite().position.y
    }
    
    func findY1(spriteX: CGFloat, spriteHeight: CGFloat, screenWidth: CGFloat, release: CGPoint, start: CGPoint) -> CGFloat {
        
        let xWidth = (screenWidth - 120) / 2
        
        let xRight = xWidth - spriteX
        
        let xDifference = release.x - start.x
        let yDifference = release.y - start.y
        let slope = yDifference / xDifference
        let y1 = slope*(xRight) + spriteHeight
        return y1
        
    }
    
    func findY2(spriteX: CGFloat, spriteHeight: CGFloat, screenWidth: CGFloat, release: CGPoint, start: CGPoint) -> CGFloat {
        let xWidth = (screenWidth - 120) / 2
        
        let xLeft = -(xWidth + spriteX)
        
        let xDifference = release.x - start.x
        let yDifference = release.y - start.y
        let slope = yDifference / xDifference
        let y2 = slope*(xLeft) + spriteHeight
        return y2
    }
    
    func firstLeft(eitherscreenWidth: CGFloat, eitherscreenHeight: CGFloat) {
        let goX = SKAction.moveTo(x: -(eitherscreenWidth / 2) + 60, duration: 0.2)
        let goY = SKAction.moveTo(y: eitherscreenHeight / 2 - 60, duration: 0.2)
        let move = SKAction.group([goX, goY])
        getSprite().run(move)
    }
    
    func secondLeft(eitherscreenWidth: CGFloat, eitherscreenHeight: CGFloat) {
        let goX = SKAction.moveTo(x: -(eitherscreenWidth / 2) + 60, duration: 0.2)
        let goY = SKAction.moveTo(y: -(eitherscreenHeight / 2) + 60, duration: 0.2)
        let move = SKAction.group([goX, goY])
        getSprite().run(move)
    }
    
    func thirdLeft(eitherscreenWidth: CGFloat, y2: CGFloat) {
        let goX = SKAction.moveTo(x: -(eitherscreenWidth / 2) + 60, duration: 0.2)
        let goY = SKAction.moveTo(y: y2, duration: 0.2)
        let move = SKAction.group([goX, goY])
        getSprite().run(move)
    }
    
    func firstRight(eitherscreenWidth: CGFloat, eitherscreenHeight: CGFloat) {
        let goX = SKAction.moveTo(x: eitherscreenWidth / 2 - 60, duration: 0.2)
        let goY = SKAction.moveTo(y: eitherscreenHeight / 2 - 60, duration: 0.2)
        let move = SKAction.group([goX, goY])
        getSprite().run(move)
    }
    
    func secondRight(eitherscreenWidth: CGFloat, eitherscreenHeight: CGFloat) {
        let goX = SKAction.moveTo(x: eitherscreenWidth / 2 - 60, duration: 0.2)
        let goY = SKAction.moveTo(y: -(eitherscreenHeight / 2) + 60, duration: 0.2)
        let move = SKAction.group([goX, goY])
        getSprite().run(move)
    }
    
    func thirdRight(eitherscreenWidth: CGFloat, y1: CGFloat) {
        let goX = SKAction.moveTo(x: eitherscreenWidth / 2 - 60, duration: 0.2)
        let goY = SKAction.moveTo(y: y1, duration: 0.2)
        let move = SKAction.group([goX, goY])
        getSprite().run(move)
    }
    
    func getPosition()-> CGPoint{
        return sprite.position
    }
    
    func run(Obama: Player, fingerRelease: CGPoint, savedPoint: Store, either: Game) {
        if Obama.findXDifference(end: fingerRelease, start: savedPoint.getPoint()) < 0
        {
            if Obama.findY2(spriteX: Obama.xPos(), spriteHeight: Obama.yPos(), screenWidth: either.screenWidth, release: fingerRelease, start: savedPoint.getPoint()) > (either.screenHeight - 120) / 2
            {
                Obama.firstLeft(eitherscreenWidth: either.screenWidth, eitherscreenHeight: either.screenHeight)
            }
            else if Obama.xPos() < 0
            {
            }
            else if Obama.findY2(spriteX: Obama.xPos(), spriteHeight: Obama.yPos(), screenWidth: either.screenWidth, release: fingerRelease, start: savedPoint.getPoint()) < -((either.screenHeight - 120) / 2)
            {
                Obama.secondLeft(eitherscreenWidth: either.screenWidth, eitherscreenHeight: either.screenHeight)
            }
            else
            {
                Obama.thirdLeft(eitherscreenWidth: either.screenWidth, y2: Obama.findY2(spriteX: Obama.xPos(), spriteHeight: Obama.yPos(), screenWidth: either.screenWidth, release: fingerRelease, start: savedPoint.getPoint()))
            }
        }
            
        else if Obama.findXDifference(end: fingerRelease, start: savedPoint.getPoint()) > 0
        {
            if Obama.findY1(spriteX: Obama.xPos(), spriteHeight: Obama.yPos(), screenWidth: either.screenWidth, release: fingerRelease, start: savedPoint.getPoint()) > ((either.screenHeight - 120) / 2)
            {
                Obama.firstRight(eitherscreenWidth: either.screenWidth, eitherscreenHeight: either.screenHeight)
            }
            else if Obama.xPos() > 0
            {
            }
            else if Obama.findY1(spriteX: Obama.xPos(), spriteHeight: Obama.yPos(), screenWidth: either.screenWidth, release: fingerRelease, start: savedPoint.getPoint()) < -((either.screenHeight - 120) / 2)
            {
                Obama.secondRight(eitherscreenWidth: either.screenWidth, eitherscreenHeight: either.screenHeight)
            }
            else
            {
                Obama.thirdRight(eitherscreenWidth: either.screenWidth, y1: Obama.findY1(spriteX: Obama.xPos(), spriteHeight: Obama.yPos(), screenWidth: either.screenWidth, release: fingerRelease, start: savedPoint.getPoint()))
            }
        }
    }
}

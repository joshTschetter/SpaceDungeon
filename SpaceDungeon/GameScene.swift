//
//  GameScene.swift
//  SpaceDungeon
//
//  Created by 64911 on 11/20/18.
//  Copyright © 2018 64911. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var Obama = Player(img: "obungo", pos: CGPoint(x: 0, y: -100), depth: 2)
    var dungeonGame = Game()
    var levelDone = false
    
    override func sceneDidLoad() {
        
       dungeonGame.addToBackground(env: self)
       dungeonGame.nextLevel(enviornment: self)
       Obama.addToEnviornment(env: self)
    
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
     
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            Obama.setStartTouch(location: position)
        }
       
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
        
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            Obama.setEndTouch(location: position)
            
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        dungeonGame.dynamicLevelBackground()
        dungeonGame.updateCurrentLevel()
        dungeonGame.optimizeLevelBackground()
        if (dungeonGame.levelDone()) {
            dungeonGame.removeStaticObject()
            
            dungeonGame.nextLevel(enviornment: self)
            levelDone = false
        }

    }
         
}

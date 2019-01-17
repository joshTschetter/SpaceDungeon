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
    var dim = Dimensions()
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var Obama = Player(img: "obungo")
  
    var pauseButton = UIButton(img: "pause", x: Int(Dimensions().screenWidth)/2 - 50, y: Int(Dimensions().screenHeight)/2 - 50 , z: 20 , visible: true)
    var pauseMenu = UIButton(img: "pausemenu", x: 0, y: 0, z: 21, visible: false)
    var startButton = UIButton(img: "startbutton", x: 0, y: 75, z: 22, visible: false)
    var endMenu = UIButton(img: "gameover", x: 0, y: 0, z: 22, visible: false)
    var restartButton = UIButton(img: "restartbutton", x: 0, y: -75, z: 23, visible: false)
    var restartButton2 = UIButton(img: "restartbutton", x: 0, y: -75, z: 23, visible: false)
    var scoreButton = UIButton(img: "Scorebutton", x: 0 - Int(Dimensions().screenWidth)/2 + 60, y: Int(Dimensions().screenHeight)/2 - 47, z: 20, visible: true)
    var gamepaused = false
    var gameOver = false
    var dungeonGame = Game()
    var levelDone = false
    var animationtimer = 0
    var savedPoint = Store(start: CGPoint(x: 0, y: 0))
    var controller = gameSceneController()
    override func sceneDidLoad() {
        dungeonGame.newUIButton(buttons: [pauseButton, pauseMenu, startButton, endMenu, restartButton, restartButton2, scoreButton])
        dungeonGame.addUIButtons(env: self)
        dungeonGame.addToBackground(env: self)
        dungeonGame.nextLevel(enviornment: self)
        Obama.addToEnvironment(env: self)
       
    
        
    }
    override func didMove(to view: SKView) {
        self.scaleMode = .resizeFill
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
//            if !gamepaused {
//              savedPoint.savePoint(point: position)
//            }
//
//            Obama.getSprite().position.x = position.x
            
            dungeonGame.buttonPressCheck(touched: position)
            savedPoint.savePoint(point: position)
            savedPoint.saveSpritePoint(point: Obama.getSprite().position)
            
        }
       
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
       
            //Obama.getSprite().position.x = position.x
            if !gameOver {
            Obama.getSprite().position.x = position.x - savedPoint.getPoint().x + savedPoint.getSpritePoint()
            if Obama.getSprite().position.x < 0 - dim.screenWidth/2 + 32 {
                Obama.getSprite().position.x = 0 - dim.screenWidth/2 + 32
            }
            if Obama.getSprite().position.x > 0 + dim.screenWidth/2 - 32 {
                Obama.getSprite().position.x = 0 + dim.screenWidth/2 - 32
            }
           
              
                
            
        }
        
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            _ = touch.location(in: self)
            if !gameOver{
            if !gamepaused {
//            Obama.run(Obama: Obama, fingerRelease: fingerRelease, savedPoint: savedPoint, either: dungeonGame)
            }
        }
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
       controller.threadFunc(GS: self)
         
}
}

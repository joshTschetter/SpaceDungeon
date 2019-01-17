//
//  reset.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/17/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class gameSceneController {
    
    func threadFunc(GS: GameScene){
        if !GS.gameOver{
           if GS.dungeonGame.collisionDetection(playerPosition: GS.Obama.getSprite().position, playerSprite: GS.Obama.getSprite(), env: GS) {
            GS.gameOver = true
          }
            if GS.pauseButton.isClicked(){
                GS.gamepaused = true
                GS.pauseMenu.makeVisible(env: GS)
                GS.startButton.makeVisible(env: GS)
                GS.restartButton2.makeVisible(env: GS)
                GS.pauseButton.click()
                GS.pauseButton.makeInvisible()
            }
            
            if !GS.gamepaused{
                
                GS.animationtimer = GS.animationtimer + 1
                GS.dungeonGame.dynamicLevelBackground()
                GS.dungeonGame.updateCurrentLevel()
                GS.dungeonGame.optimizeLevelBackground()
                GS.dungeonGame.updateScore(position: GS.Obama.getPosition())
                
                if (GS.animationtimer % 30 == 0){
                    GS.dungeonGame.animateBackground()
                }
                
                if (GS.dungeonGame.levelDone()) {
                    GS.dungeonGame.removeStaticObject()
                    
                    GS.dungeonGame.nextLevel(enviornment: GS)
                    GS.levelDone = false
                }
                
            }
            else if GS.gamepaused {
                if GS.startButton.isClicked(){
                    GS.gamepaused = false
                    GS.pauseButton.makeVisible(env: GS)
                    GS.pauseMenu.makeInvisible()
                    GS.restartButton2.makeInvisible()
                    GS.startButton.makeInvisible()
                    GS.startButton.click()
                }
                if GS.restartButton2.isClicked(){
                    resetScene(env: GS)
                    
                }
            }
        }
        else {
            GS.endMenu.makeVisible(env: GS)
            GS.restartButton.makeVisible(env: GS)
            GS.pauseButton.makeInvisible()
            if GS.restartButton.isClicked(){
                    resetScene(env: GS)
                    
            }
        }
    
    }
    
    
    
    
    func resetScene(env: GameScene){
        env.removeAllChildren()
        env.dim = Dimensions()
        env.entities = [GKEntity]()
        env.graphs = [String : GKGraph]()
        env.Obama = Player(img: "obungo")
        
        env.pauseButton = UIButton(img: "pause", x: Int(Dimensions().screenWidth)/2 - 50, y: Int(Dimensions().screenHeight)/2 - 50 , z: 20 , visible: true)
        env.pauseMenu = UIButton(img: "pausemenu", x: 0, y: 0, z: 21, visible: false)
        env.startButton = UIButton(img: "startbutton", x: 0, y: 75, z: 22, visible: false)
        env.endMenu = UIButton(img: "gameover", x: 0, y: 0, z: 22, visible: false)
        env.restartButton = UIButton(img: "restartbutton", x: 0, y: -75, z: 23, visible: false)
        env.restartButton2 = UIButton(img: "restartbutton", x: 0, y: -75, z: 23, visible: false)
        env.scoreButton = UIButton(img: "Scorebutton", x: 0 - Int(Dimensions().screenWidth)/2 + 55, y: Int(Dimensions().screenHeight)/2 - 47, z: 20, visible: true)
        env.gamepaused = false
        env.gameOver = false
        env.dungeonGame = Game()
        env.levelDone = false
        env.animationtimer = 0
        env.savedPoint = Store(start: CGPoint(x: 0, y: 0))
        env.dungeonGame.newUIButton(buttons: [env.pauseButton, env.pauseMenu, env.startButton, env.endMenu, env.restartButton, env.restartButton2, env.scoreButton])
        env.dungeonGame.addUIButtons(env: env)
        env.dungeonGame.addToBackground(env: env)
        env.dungeonGame.nextLevel(enviornment: env)
        env.Obama.addToEnvironment(env: env)
       
        
        
    }

}

//
//  Game.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/6/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class Game {
    
    private var levels = [Level]()
    private var onLevel = 0
    private var levelAmt = 2
    private var movingBackground : Background
    init () {
        
        for number in 1...levelAmt {
            
            let lAmt = 17
            let diff = 4
            let lSprite = "thing"
    
            let newLevel = Level(ledgeAmt: lAmt, Difficulty: diff, ledgeSprite: lSprite)
            levels.append(newLevel)
            print(levels)
            
        }
       movingBackground = Background(numofScreens: 14, imgs: ["bg"], staticbgimg: "statue")
       
    }
    func levelDone()-> Bool {
        return levels[onLevel].levelDone()
    }
    func nextLevel (enviornment: GameScene){
        print(levels)
        if (onLevel + 1 <= levelAmt - 1){
        print(onLevel)
        onLevel = onLevel + 1
        levels[onLevel].addLevelLedges(env: enviornment)
        movingBackground.addImage(count: 15, image: ["bg2"], enviornment: enviornment)
//        movingBackground.addStaticImage(img: "statue", x: 0, y: 150, enviornment: enviornment, removeothers: true)
        }
        else {
            print("error: No next level found")
        }
    }
    func optimizeLevelBackground (){
        movingBackground.optimizeBackground()
    }
    func dynamicLevelBackground(){
        movingBackground.dynamicBackground()
    }
    func updateCurrentLevel(){
        levels[onLevel].update()
        levels[onLevel].optimize()
    }
    func getLevelAmt ()-> Int {
        return self.levelAmt
    }
    func removeStaticObject(){
        movingBackground.removeStaticObjects()
    }
    func addToBackground(env: GameScene){
        movingBackground.addBackground(env: env)
    }
    
}

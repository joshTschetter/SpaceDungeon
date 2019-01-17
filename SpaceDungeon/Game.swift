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
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
  
    var score : scoreTracker
    private var levels = [Level]()
    private var counter = 0
    private var onLevel = -1
    private var levelAmt = 5
    private var movingBackground : Background
    var introthree = SKSpriteNode(imageNamed: "canuwin")
    var introfour = SKSpriteNode(imageNamed: "enjoy")
    var introone = SKSpriteNode(imageNamed: "introtext1")
    var introtwo = SKSpriteNode(imageNamed: "introtext2")
    var epic = SKSpriteNode(imageNamed: "epic")
    var moon = SKSpriteNode(imageNamed: "moon")
    var city = SKSpriteNode(imageNamed: "city1")
    var win = SKSpriteNode(imageNamed: "winner")
    private var UIButtons = [UIButton]()
  
    //////level one
    private var moonInitializer = staticObjectInitializer(img: "city1", x: Int(100000000), y: Int(1000000000 ), z: 2 )
//    private var asteroidInitializer = staticObjectInitializer(img: "asteroid", x: Int(-Dimensions().screenWidth/2 - 100), y: -200, z: 20, xDestination: Int(Dimensions().screenWidth/2 + 100), yDestination: 200, movementspeed: 20)
    ////////////////////////////////////////////////////////
    private var levelonebgImages: [staticObjectInitializer]
    init () {
       
        for number in 0...levelAmt {
            
            var newLevel = Level(ledgeAmt: 25, Difficulty: 100000, ledgeSprite: ["dagger", "dagger2", "daggermid"])
            
            if number == 1 {
               newLevel = Level(ledgeAmt: 28, Difficulty: 4, ledgeSprite: ["dagger", "dagger2", "daggermid"])
            }
            
            if number == 2 {
                newLevel = Level(ledgeAmt: 35, Difficulty: 4, ledgeSprite: ["log", "log", "midlog"])
            }
            if number == 3 {
            
                newLevel = Level(ledgeAmt: 40, Difficulty: 4, ledgeSprite: ["cityledge2", "cityledge", "cityledgemid"])
            }
            if number == 4 {
                
                newLevel = Level(ledgeAmt: 100, Difficulty: 4, ledgeSprite: ["moonrock", "moonrock", "moonrockmid"])
            }
            levels.append(newLevel)
            print(levels)
            
        }
      levelonebgImages = []
       movingBackground = Background(numofScreens: 4, imgs: ["introbg", "introbg"], staticbgimg: levelonebgImages)
        
        score = scoreTracker(score: 0, x: -90, y: (90), z: 30, font: "Arial Black-Bold", fontsize: 40)
    }
    func levelDone()-> Bool {
        return levels[onLevel].levelDone()
    }
    func nextLevel (enviornment: GameScene){
        print(levels)
        if (onLevel < levelAmt - 1){
        print(onLevel)
        onLevel = onLevel + 1
        levels[onLevel].addLevelLedges(env: enviornment)
            if onLevel == 0 {
        movingBackground.addImage(count: 1, image: ["introtrans", "introtrans" ], enviornment: enviornment)
         movingBackground.addImage(count: 1, image: ["dung1", "dung1" ], enviornment: enviornment)
        movingBackground.addImage(count: 1, image: ["dungeontransition1", "dungeontransition1" ], enviornment: enviornment)
        movingBackground.addImage(count: 4, image: ["bg", "bg"], enviornment: enviornment)
        movingBackground.addImage(count: 1, image: ["dungeontransition2", "dungeontransition2" ], enviornment: enviornment)
        movingBackground.addImage(count: 4, image: ["nlights1", "nlights2", "nlights1", "nlights3"], enviornment: enviornment)
        movingBackground.addImage(count: 1, image: ["cityt1", "cityt2", "cityt3" ], enviornment: enviornment)
        movingBackground.addImage(count: 50, image: ["bgwstars", "bgwostars", "bgmidstar", "bgwostars"], enviornment: enviornment)
        let moveAction = SKAction.moveTo(y: CGFloat(-1000), duration: TimeInterval(5))
        let moveAction2 = SKAction.moveTo(y: CGFloat(-1000), duration: TimeInterval(10))
        let moveAction3 = SKAction.moveTo(y: CGFloat(-1000), duration: TimeInterval(15))
        let moveAction4 = SKAction.moveTo(y: CGFloat(-1000), duration: TimeInterval(20))
        introone.position = CGPoint(x: 0, y: 1500)
        introtwo.position = CGPoint(x: 0, y: 3000)
        introthree.position = CGPoint(x: 0, y: 4500)
        introfour.position = CGPoint(x: 0, y: 6000)
        enviornment.addChild(introone)
        enviornment.addChild(introtwo)
        enviornment.addChild(introthree)
        enviornment.addChild(introfour)
        introone.run(moveAction)
        introtwo.run(moveAction2)
        introthree.run(moveAction3)
        introfour.run(moveAction4)
                    }
            if onLevel == 2 {
                let moveAction5 = SKAction.moveTo(y: CGFloat(-1000), duration: TimeInterval(5))
                enviornment.addChild(epic)
                epic.position = CGPoint(x: 0, y: 1500)
                epic.run(moveAction5)
            }
            if onLevel == 3 {
                city.size.width = Dimensions().screenWidth
                city.position = CGPoint(x: 0, y: -600)
                city.run(SKAction.moveTo(y: 0 - Dimensions().screenHeight/2 + city.size.height/2, duration: TimeInterval(9)))
               
                enviornment.addChild(city)
                enviornment.addChild(win)
                win.position = CGPoint(x: 0, y: -1000)
            }
        }
        else {
            print("error: No next level found")
           
            let moveAction = SKAction.moveTo(y: CGFloat(1000), duration: TimeInterval(2))
            let moveAction2 = SKAction.moveTo(y: CGFloat(150), duration: TimeInterval(2))
            let moveAction3 = SKAction.move(to: CGPoint(x: win.position.x, y: win.position.y + 230), duration: TimeInterval(0.25))
            let moveAction4 = SKAction.move(to: CGPoint(x: win.position.x, y: enviornment.scoreButton.image.position.y - 10), duration: TimeInterval(0))
            enviornment.Obama.getSprite().run(moveAction)
            enviornment.scoreButton.image.run(moveAction3)
            score.getLabel().run(moveAction4)
            win.run(moveAction2)
     
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
        score.setEnviornment(env: env)
        
    }
    func animateBackground(){
        movingBackground.animateBackground()
    }
    func addUIButtons(env: GameScene){
        for item in UIButtons{
        item.image.position = CGPoint(x: item.xPos, y: item.yPos)
           if item.isVisible(){
        env.addChild(item.image)
            }
        }
    }
    func newUIButton(buttons: [UIButton]){
    for item in buttons {
    UIButtons.append(item)
    }
    }
    func buttonPressCheck (touched: CGPoint){
        for item in UIButtons {
            item.press(touch: touched)
        }
    }
    func updateScore(position: CGPoint){
        if (counter % 5 == 0){
        score.addOne()
        }
        score.changePosition(pos: position)
        counter = counter + 1
    }
    
    func collisionDetection(playerPosition: CGPoint, playerSprite: SKSpriteNode, env: GameScene)-> Bool {
        let DidCollide = false
        
        let SX = playerPosition.x
        let SW = playerSprite.size.width/2
        let SY = playerPosition.y
        let SH = playerSprite.size.height/2

        for item in levels[onLevel].Ledges {
            let LX = item.getSprite().position.x
            let LY = item.getSprite().position.y
            let LW = item.getSprite().size.width/2
            let LH = item.getSprite().size.height/2
            if (SX + SW >= LX - LW) && (SX - SW <= LX + LW) && !(SY - SH > LY - LH) && !(SY + SH < LY - LH){
                return true
            }
        }
        return DidCollide
        }
}


//
//  Background.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/5/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import GameplayKit

class Background{
    
    var backgrounds = [BackgroundTile]()
    var staticObjects = [BackgroundObject]()
    
    init(numofScreens: Int, imgs: [String]){
        for _ in 1 ... numofScreens {
                let bgOne = BackgroundTile(images: imgs, speed: 5)
                backgrounds.append(bgOne)
        }
    }
    init(numofScreens: Int, imgs: [String], staticbgimg: [staticObjectInitializer]){
        for _ in 1 ... numofScreens {
            let bgOne = BackgroundTile(images: imgs, speed: 5)
            backgrounds.append(bgOne)
           
        }
        for item in staticbgimg {
            let bgObject = BackgroundObject(img: item.image, x: item.xPos, y: item.yPos, z: item.zPos, xDestination: item.xDes, yDestination: item.yDes, speed: item.speed)
            staticObjects.append(bgObject)
            
        }
    }
    
    func addBackground(env: GameScene){
        
        var counter = 0
        for item in backgrounds {
            if counter == 0 {
                var zcounter = -1
                for tile in item.getSprites(){
                    env.addChild(tile)
                    tile.position.x = 0
                    tile.position.y = CGFloat(0)
                    item.setYpos(y: 0)
                    tile.zPosition = CGFloat(zcounter)
                    zcounter = zcounter - 1
                }
            }
            else {
                var zcounter = -1
                for tile in item.getSprites(){
                    env.addChild(tile)
                    tile.position.x = 0
                    tile.position.y = CGFloat(backgrounds[counter - 1].getYpos() + Int(Dimensions().screenHeight))
                    item.setYpos(y: backgrounds[counter - 1].getYpos() + Int(Dimensions().screenHeight) - 1)
                    tile.zPosition = CGFloat(zcounter)
                    zcounter = zcounter - 1
                }
           
            }
            
            counter = counter + 1
        }
        for item in staticObjects{
            
            env.addChild(item.objectImages)
    
        }
        
    }
    func addImage(count: Int, image: [String], enviornment: GameScene){
        for _ in 1...count{
            let newImg = BackgroundTile(images: image, speed: 5)
            backgrounds.append(newImg)
            for item in backgrounds{
                for tile in item.getSprites(){
                    tile.removeFromParent()
                }
            }
            for item in staticObjects{
                
                    item.objectImages.removeFromParent()
                
            
        }
            addBackground(env: enviornment)
    }
    }
    func dynamicBackground(){
//        for item in staticObjects{
//            item.moveifcan()
////            item.animateifCan()
//        }
      
        for item in backgrounds {
            for tile in item.getSprites() {
                let moveAction = SKAction.moveTo(y: CGFloat(tile.position.y - 50), duration: TimeInterval(0.25))
                tile.run(moveAction)
                tile.position.y = tile.position.y
                item.setYpos(y: Int(tile.position.y))
                
            }
            
        }
        
    }
    
    func addStaticImage(img: String, x: Int, y: Int, enviornment: GameScene, removeothers: Bool){
    
    
                let obj = BackgroundObject(img: img, x: x, y: y, z: 2)
                if removeothers {
                removeStaticObjects()
                }
                staticObjects.append(obj)
                for item in backgrounds{
                    for tile in item.getSprites(){
                    tile.removeFromParent()
                    }
                }
                for item in staticObjects{
                    
                        item.objectImages.removeFromParent()
                    
                    
                }
                addBackground(env: enviornment)
            
        
    }
    func removeStaticObjects(){
        for item in staticObjects{
                item.objectImages.removeFromParent()
            
            
        }
    }
    
    func optimizeBackground(){
        
        for item in backgrounds {
            if item.getYpos() <  -Int(Dimensions().screenHeight) - 100 {
                for tile in item.getSprites() {
                tile.removeFromParent()
                }
            }
            
        }
    }
    func animateBackground(){
        
        for item in backgrounds{
            var counter = 0
            var saveZpos = 0
            for tile in item.getSprites(){
                if counter == 0 {
                    saveZpos = Int(tile.zPosition)
                    tile.zPosition = item.getSprites()[counter + 1].zPosition
                    print(item.getSprites()[counter + 1].zPosition)
                }
                else if counter == item.getSprites().count - 1 {
                    tile.zPosition = CGFloat(saveZpos)
                    print(CGFloat(saveZpos))
                }
                else {
                    tile.zPosition = item.getSprites()[counter + 1].zPosition
                    print(item.getSprites()[counter + 1].zPosition)
                }
                
                counter = counter + 1
            }
        }
    }

}
    




//
//  UIButton.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/12/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class UIButton {

    var clicked = false
    var image : SKSpriteNode
    var xPos : Int
    var yPos : Int
    var isvisible : Bool
    init(img: String, x: Int, y: Int, z: Int, visible: Bool){
        image = SKSpriteNode(imageNamed: img)
        image.color = .white
        image.zPosition = CGFloat(z)
        xPos = x
        yPos = y
        isvisible = visible
    }
    
    func click() {
        if !clicked{
        self.clicked = true
        }
        else {
        self.clicked = false 
        }
    }
    func press(touch: CGPoint){
        if ((Int((touch.x)) >= xPos - 50) && (Int(touch.x) <= xPos + 50)) && ((Int(touch.y) >= yPos - 50) && (Int(touch.y) <= yPos + 50)) {
            self.click()
        }
    }
    func isClicked()-> Bool {
        return self.clicked
    }
    func makeVisible(env: GameScene ){
        image.removeFromParent()
        self.isvisible = true
        env.addChild(image)
    }
    func makeInvisible(){
        self.isvisible = false
        image.removeFromParent()
    }
    func isVisible()-> Bool {
        return self.isvisible
    }
    
}

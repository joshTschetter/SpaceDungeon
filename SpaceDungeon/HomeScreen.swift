//
//  HomeScreen.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/17/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class HomeScreen: SKScene {
    
    var lucas = SKSpriteNode(imageNamed: "startscreen")

    override func didMove(to view: SKView) {
        self.scaleMode = .resizeFill
        lucas.size.width = Dimensions().screenWidth
        lucas.size.height = Dimensions().screenHeight
        lucas.position = CGPoint(x: 0, y: 0)
        
        self.addChild(lucas)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let scene = GameScene(fileNamed: "GameScene") {
            let reveal = SKTransition.fade(withDuration: 1)
            view?.presentScene(scene, transition: reveal)
        }
    }
}

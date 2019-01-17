//
//  staticObjectInitializer.swift
//  SpaceDungeon
//
//  Created by 64911 on 12/14/18.
//  Copyright © 2018 64911. All rights reserved.
//

import UIKit

class staticObjectInitializer{
   
    var image: String
    var xPos: Int
    var yPos: Int
    var zPos: Int
    var xDes: Int
    var yDes: Int
    var speed: Int
    init(img: String, x: Int, y: Int, z: Int ){
        image = img
        xPos = x
        yPos = y
        zPos = z
        xDes = x
        yDes = y
        speed = 0
    }
    init(img: String, x: Int, y: Int, z: Int, xDestination: Int, yDestination: Int, movementspeed: Int){
        image = img
        xPos = x
        yPos = y
        zPos = z
        xDes = xDestination
        yDes = yDestination
        speed = movementspeed
    }
}

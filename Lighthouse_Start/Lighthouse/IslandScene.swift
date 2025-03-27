//
//  IslandScene.swift
//  LighthouseChallenge
//
//  Created by Ibram Uppal on 4/3/15.
//  Copyright (c) 2015 Ibram Uppal. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class IslandScene: SCNScene {
    
    let islandAttachNode = SCNNode()
    
    convenience init(create: Bool) {
        self.init()
        
        
        
        setupCameraAndLights()
    }
    
    func setupCameraAndLights() {
        
        let cameraNode = SCNNode()
        cameraNode.pivot = SCNMatrix4MakeTranslation(0, 0, -5)
        cameraNode.camera = SCNCamera()
        cameraNode.camera!.usesOrthographicProjection = false
        cameraNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: Float(-M_PI_4 / 2.0))
        
        rootNode.addChildNode(cameraNode)
        
        let lightOne = SCNNode()
        lightOne.light = SCNLight()
        lightOne.light!.type = SCNLightTypeSpot
        lightOne.light!.color = UIColor.whiteColor()
        lightOne.position = SCNVector3(x: -3, y: 3, z: 3)
        
        let lightTwo = SCNNode()
        lightTwo.light = SCNLight()
        lightTwo.light!.type = SCNLightTypeSpot
        lightTwo.light!.color = UIColor.whiteColor()
        lightTwo.position = SCNVector3(x: 3, y: 3, z: 3)
        
        let lightThree = SCNNode()
        lightThree.light = SCNLight()
        lightThree.light!.type = SCNLightTypeSpot
        lightThree.light!.color = UIColor(red: 0x5E/255.0, green: 0xEA/255.0, blue: 0xFF/255.0, alpha: 0.3)
        lightThree.position = SCNVector3(x: 1, y: 1, z: -1)
        
        let lightFour = SCNNode()
        lightFour.light = SCNLight()
        lightFour.light!.type = SCNLightTypeSpot
        lightFour.light!.spotOuterAngle = 20.0
        lightFour.light!.color = UIColor(red: 0x0F/255.0, green: 0xFF/255.0, blue: 0xAD/255.0, alpha: 0.3)
        lightFour.position = SCNVector3(x: -1, y: 1, z: 1)
        
        let lookAtNodeRight = SCNNode()
        lookAtNodeRight.position = SCNVector3(x: 0.5, y: 0, z: -0.5)
        
        let lookAtNodeLeft = SCNNode()
        lookAtNodeLeft.position = SCNVector3(x: -0.5, y: 0, z: 0.5)
        
        let lookAtNodeCenter = SCNNode()
        lookAtNodeCenter.position = SCNVector3Zero
        
        lightOne.constraints = [SCNLookAtConstraint(target: lookAtNodeCenter)]
        lightTwo.constraints = [SCNLookAtConstraint(target: lookAtNodeCenter)]
        lightThree.constraints = [SCNLookAtConstraint(target: lookAtNodeRight)]
        lightFour.constraints = [SCNLookAtConstraint(target: lookAtNodeLeft)]
        
        self.rootNode.addChildNode(lightOne)
        self.rootNode.addChildNode(lightTwo)
        self.rootNode.addChildNode(lightThree)
        self.rootNode.addChildNode(lightFour)
        
    }

}
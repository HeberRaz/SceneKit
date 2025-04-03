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
    let islandAttachScale: Float = 0.15
    var currentIslandRotation = -Float.pi / 4.0

    convenience init(create: Bool) {
        self.init()
        
        setupIslandAttachNode()

        rootNode.addChildNode(islandAttachNode)

        addChildNodes()

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
        lightOne.light!.type = .spot
        lightOne.light!.color = UIColor.white
        lightOne.position = SCNVector3(x: -3, y: 3, z: 3)
        
        let lightTwo = SCNNode()
        lightTwo.light = SCNLight()
        lightTwo.light!.type = .spot
        lightTwo.light!.color = UIColor.white
        lightTwo.position = SCNVector3(x: 3, y: 3, z: 3)
        
        let lightThree = SCNNode()
        lightThree.light = SCNLight()
        lightThree.light!.type = .spot
        lightThree.light!.color = UIColor(red: 0x5E/255.0, green: 0xEA/255.0, blue: 0xFF/255.0, alpha: 0.3)
        lightThree.position = SCNVector3(x: 1, y: 1, z: -1)
        
        let lightFour = SCNNode()
        lightFour.light = SCNLight()
        lightFour.light!.type = .spot
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

    private func setupIslandAttachNode() {
        islandAttachNode.scale = SCNVector3(x: islandAttachScale, y: islandAttachScale, z: islandAttachScale)
        islandAttachNode.rotation = SCNVector4(0,1,0, currentIslandRotation)
    }

    private func addChildNodes() {
        addNodeToIslandIfExists(named: .lighthouse)
        addNodeToIslandIfExists(named: .rocks)
        addNodeToIslandIfExists(named: .water)
        addNodeToIslandIfExists(named: .cloud1)
        addNodeToIslandIfExists(named: .cloud2)
        addNodeToIslandIfExists(named: .schoolOfFish)
        addNodeToIslandIfExists(named: .jumpingFish)
    }

    private func addNodeToIslandIfExists(named name: LighthouseSceneGraph) {
        let islandSceneFile = SCNScene(named: "art.scnassets/Lighthouse.scn")
        if let node = islandSceneFile?.rootNode.childNode(withName: name.rawValue, recursively: true) {
            islandAttachNode.addChildNode(node)
        } else {
            assertionFailure("Failed to add node named \(name.rawValue) to the island")
        }
    }
}

//
//  GameScene.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 26/03/25.
//

import UIKit
import QuartzCore
import SceneKit

final class GameScene: SCNScene {
    let spotlightNode = SpotLightNode()
    let cameraNode = CameraNode()
    let ambientLight = AmbientLightNode()
    let spotLookAtNode = SpotLookAtNode()
    let deer = DeerNode()

    var timeLast: Double?
    var previousRotation = 0.0
    let rotationConstant = 0.6

    convenience init(create: Bool) {
        self.init()

        guard create else { return }

        setupView()

        rootNode.addChildNode(deer)
    }

    // MARK: - View Helpers

    private func addChildNodes() {
        rootNode.addChildNode(cameraNode)
        rootNode.addChildNode(spotlightNode)
        rootNode.addChildNode(ambientLight)
    }

    private func setupConstraints() {
        spotlightNode.setupConstraints(target: spotLookAtNode)
        cameraNode.setupConstraints(target: spotLookAtNode)
    }

    private func setupView() {
        addChildNodes()
        setupConstraints()
    }
}

extension GameScene: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        let dt: Double
        if let timeLast {
            dt = time - timeLast
        } else {
            dt = 0
        }

        timeLast = time
        let rotationAmount = (rotationConstant * dt) + previousRotation
        previousRotation = rotationAmount
        deer.rotation = SCNVector4(0, 1, 0, -rotationAmount)
    }
}

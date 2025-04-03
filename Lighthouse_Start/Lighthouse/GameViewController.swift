//
//  GameViewController.swift
//  Lighthouse
//
//  Created by Ibram Uppal on 11/2/15.
//  Copyright (c) 2015 Ibram Uppal. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var sceneView: SCNView?
    let scene = IslandScene(create: true)

    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView = self.view as? SCNView
        if let view = sceneView {
            view.scene = scene
            view.showsStatistics = true
            view.backgroundColor = UIColor(red: 0x5E/255.0, green: 0xEA/255.0, blue: 0xFF/255.0, alpha: 1)
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(_:)))
            view.addGestureRecognizer(panGesture)

        }
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let xTranslation = Float(gesture.translation(in: view).x)
        var angle: Float = xTranslation * Float.pi / 200

        angle += scene.currentIslandRotation
        scene.islandAttachNode.rotation = SCNVector4(x: 0, y: 1, z: 0, w: angle)

        if gesture.state == .ended || gesture.state == .cancelled {
            scene.currentIslandRotation = angle
        }
    }
}

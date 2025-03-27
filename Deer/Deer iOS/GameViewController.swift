//
//  GameViewController.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 24/03/25.
//

import UIKit
import SceneKit

// MARK: - GameViewController

class GameViewController: UIViewController {
    
    var sceneView: SCNView?
    let scene = GameScene(create: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = self.view as? SCNView

        if let sceneView {
            sceneView.scene = scene
            sceneView.delegate = scene
            sceneView.isPlaying = true
            sceneView.showsStatistics = true
            sceneView.backgroundColor = UIColor(red: 0xc9/255, green: 0xfc/255, blue: 0xfb/255, alpha: 1)
            sceneView.antialiasingMode = .multisampling4X
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

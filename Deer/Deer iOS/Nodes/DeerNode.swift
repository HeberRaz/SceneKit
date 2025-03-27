//
//  DeerScene.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 26/03/25.
//

import SceneKit

final class DeerNode: SCNNode {

    override init() {
        super.init()

        let deer = Self.createDeer()
        addChildNode(deer)

        // Apply scaling and rotation to the whole container (self)
        self.scale = SCNVector3(1, 1, 1) // or whatever makes it visible
        self.rotation = SCNVector4(0, 1, 0, -Float.pi / 4)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Helpers

    private static func createDeer() -> SCNNode {
        guard let deerScene = SCNScene(named: "Art.scnassets/Deer.dae"),
              let deer = deerScene.rootNode.childNode(withName: "Deer", recursively: true) else {
            return SCNNode()
        }

        return deer
    }
}

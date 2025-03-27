//
//  SpotLookAtNode.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 26/03/25.
//

import SceneKit

final class SpotLookAtNode: SCNNode {
    override init() {
        super.init()
        self.position = SCNVector3Zero
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

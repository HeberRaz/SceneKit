//
//  AmbientLightNode.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 26/03/25.
//

import SceneKit

final class AmbientLightNode: SCNNode {
    override init() {
        super.init()
        self.light = SCNLight()
        self.light?.type = .ambient
        self.light?.color = UIColor.white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

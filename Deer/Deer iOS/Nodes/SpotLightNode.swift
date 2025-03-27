//
//  SpotLightNode.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 26/03/25.
//

import SceneKit

final class SpotLightNode: SCNNode {
    override init() {
        super.init()
        self.light = SCNLight()
        self.light?.type = .spot
        self.light?.attenuationStartDistance = 0
        self.light?.attenuationEndDistance = 50
        self.light?.color = UIColor(red: 1, green: 0x2b/255, blue: 0x71/255, alpha: 1)
        self.position = SCNVector3(x: 0, y: 2, z: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints(target: SCNNode) {
        self.constraints = [SCNLookAtConstraint(target: target)]
    }
}

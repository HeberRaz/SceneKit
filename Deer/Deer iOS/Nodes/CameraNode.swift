//
//  CameraNode.swift
//  Deer iOS
//
//  Created by Heber Alvarez on 26/03/25.
//

import SceneKit

final class CameraNode: SCNNode {
    override init() {
        super.init()
        self.camera = SCNCamera()
        self.camera?.usesOrthographicProjection = true
        self.position = SCNVector3(x: 0, y: 1, z: 5)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints(target: SCNNode) {
        self.constraints = [SCNLookAtConstraint(target: target)]
    }
}

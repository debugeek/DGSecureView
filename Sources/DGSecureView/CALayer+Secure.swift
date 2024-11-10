//
//  CALayer+Secure.swift
//  DGSecureView
//
//  Created by Xiao Jin on 10/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit

public extension CALayer {

    func setScreenshotsDisabled(_ disabled: Bool) {
        guard let secureComponents = DGSecureView.secureComponents else {
            return
        }

        let previousLayer = secureComponents.0.layer
        secureComponents.0.setValue(self, forKey: "layer")
        if disabled {
            secureComponents.1.isSecureTextEntry = false
            secureComponents.1.isSecureTextEntry = true
        } else {
            secureComponents.1.isSecureTextEntry = true
            secureComponents.1.isSecureTextEntry = false
        }
        secureComponents.0.setValue(previousLayer, forKey: "layer")
    }

}

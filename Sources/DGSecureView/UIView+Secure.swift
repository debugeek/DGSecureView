//
//  UIView+Secure.swift
//  DGSecureView
//
//  Created by Xiao Jin on 10/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit

public extension UIView {

    func setScreenshotsDisabled(_ disabled: Bool) {
        layer.setScreenshotsDisabled(disabled)
    }

}

//
//  ViewController.swift
//  DGSecureViewDemo
//
//  Created by Xiao Jin on 10/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit
import DGSecureView

class ViewController: UIViewController {

    @IBAction func switchValueDidChange(_ sender: UISwitch) {
        view.layer.setScreenshotsDisabled(sender.isOn)
    }

}


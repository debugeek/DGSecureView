//
//  DGSecureView.swift
//  DGSecureView
//
//  Created by Xiao Jin on 10/11/24.
//  Copyright © 2024 debugeek. All rights reserved.
//

import UIKit
import ObjectiveC


struct DGSecureView {

    private static let xorKey: UInt8 = 0xEE

    static let secureComponents: (UIView, UITextField)? = {
        let bytes: [UInt8]
        if #available(iOS 15.0, *) {
            bytes = [
                0xB1, 0xBB, 0xA7, 0xBA, 0x8B, 0x96, 0x9A, 0xA2,
                0x8F, 0x97, 0x81, 0x9B, 0x9A, 0xAD, 0x8F, 0x80,
                0x98, 0x8F, 0x9D, 0xB8, 0x87, 0x8B, 0x99, 0xEE
            ]
        } else if #available(iOS 13.0, *) {
            bytes = [
                0xB1, 0xBB, 0xA7, 0xBA, 0x8B, 0x96, 0x9A, 0xA8,
                0x87, 0x8B, 0x82, 0x8A, 0xAD, 0x8F, 0x80, 0x98,
                0x8F, 0x9D, 0xB8, 0x87, 0x8B, 0x99, 0xEE
            ]
        } else if #available(iOS 12.0, *) {
            bytes = [
                0xB1, 0xBB, 0xA7, 0xBA, 0x8B, 0x96, 0x9A, 0xA8,
                0x87, 0x8B, 0x82, 0x8A, 0xAD, 0x81, 0x80, 0x9A,
                0x8B, 0x80, 0x9A, 0xB8, 0x87, 0x8B, 0x99, 0xEE
            ]
        } else {
            return nil
        }

        let className = bytes.map { $0 ^ xorKey }.withUnsafeBufferPointer {
            String(cString: $0.baseAddress!)
        }
        let textField = UITextField()
        for subview in textField.subviews {
            if NSStringFromClass(type(of: subview)) == className {
                return (subview, textField)
            }
        }

        return nil
    }()

}

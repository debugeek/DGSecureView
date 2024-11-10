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
        var buf: UnsafeMutablePointer<UInt8>
        var len: size_t = 0

        if #available(iOS 15.0, *) {
            let bytes: [UInt8] = [
                0x5F ^ xorKey, 0x55 ^ xorKey, 0x49 ^ xorKey, 0x54 ^ xorKey, 0x65 ^ xorKey, 0x78 ^ xorKey,
                0x74 ^ xorKey, 0x4C ^ xorKey, 0x61 ^ xorKey, 0x79 ^ xorKey, 0x6F ^ xorKey, 0x75 ^ xorKey,
                0x74 ^ xorKey, 0x43 ^ xorKey, 0x61 ^ xorKey, 0x6E ^ xorKey, 0x76 ^ xorKey, 0x61 ^ xorKey,
                0x73 ^ xorKey, 0x56 ^ xorKey, 0x69 ^ xorKey, 0x65 ^ xorKey, 0x77 ^ xorKey, 0x00 ^ xorKey
            ]
            len = bytes.count
            buf = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
            buf.update(from: bytes, count: len)
        } else if #available(iOS 13.0, *) {
            let bytes: [UInt8] = [
                0x5F ^ xorKey, 0x55 ^ xorKey, 0x49 ^ xorKey, 0x54 ^ xorKey, 0x65 ^ xorKey, 0x78 ^ xorKey,
                0x74 ^ xorKey, 0x46 ^ xorKey, 0x69 ^ xorKey, 0x65 ^ xorKey, 0x6C ^ xorKey, 0x64 ^ xorKey,
                0x43 ^ xorKey, 0x61 ^ xorKey, 0x6E ^ xorKey, 0x76 ^ xorKey, 0x61 ^ xorKey, 0x73 ^ xorKey,
                0x56 ^ xorKey, 0x69 ^ xorKey, 0x65 ^ xorKey, 0x77 ^ xorKey, 0x00 ^ xorKey
            ]
            len = bytes.count
            buf = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
            buf.update(from: bytes, count: len)
        } else if #available(iOS 12.0, *) {
            let bytes: [UInt8] = [
                0x5F ^ xorKey, 0x55 ^ xorKey, 0x49 ^ xorKey, 0x54 ^ xorKey, 0x65 ^ xorKey, 0x78 ^ xorKey,
                0x74 ^ xorKey, 0x46 ^ xorKey, 0x69 ^ xorKey, 0x65 ^ xorKey, 0x6C ^ xorKey, 0x64 ^ xorKey,
                0x43 ^ xorKey, 0x6F ^ xorKey, 0x6E ^ xorKey, 0x74 ^ xorKey, 0x65 ^ xorKey, 0x6E ^ xorKey,
                0x74 ^ xorKey, 0x56 ^ xorKey, 0x69 ^ xorKey, 0x65 ^ xorKey, 0x77 ^ xorKey, 0x00 ^ xorKey
            ]
            len = bytes.count
            buf = UnsafeMutablePointer<UInt8>.allocate(capacity: len)
            buf.update(from: bytes, count: len)
        } else {
            return nil
        }

        // Reverse XOR to retrieve the original class name
        buf.withMemoryRebound(to: UInt8.self, capacity: len) { ptr in
            for i in 0..<len {
                ptr[i] ^= xorKey
            }
        }

        let className = String(cString: buf)
        buf.deallocate()

        let textField = UITextField()
        for subview in textField.subviews {
            if NSStringFromClass(type(of: subview)) == className {
                return (subview, textField)
            }
        }

        return nil
    }()

}

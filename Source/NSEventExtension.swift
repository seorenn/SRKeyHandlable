//
//  NSEventExtension.swift
//  SRKeyHandlable
//
//  Created by Heeseung Seo on 16/04/2019.
//  Copyright © 2019 Seorenn. All rights reserved.
//

import Cocoa

public extension NSEvent {

    var isKeyEvent: Bool {
        return type == .keyDown || type == .keyUp
    }

    var isPressingCommandKey: Bool {
        guard isKeyEvent else { return false }
        return modifierFlags.contains(.command)
    }

    var isPressingControlKey: Bool {
        guard isKeyEvent else { return false }
        return modifierFlags.contains(.control)
    }

    var isPressingOptionKey: Bool {
        guard isKeyEvent else { return false }
        return modifierFlags.contains(.option)
    }

    var isPressingShiftKey: Bool {
        guard isKeyEvent else { return false }
        return modifierFlags.contains(.shift)
    }

    var keyString: String? {
        return SRKeyMap.string(keyCode: keyCode)
    }

    func isPressing(keyString: String) -> Bool {
        return keyCode == SRKeyMap.keyCodeMap[keyString.lowercased()]
    }

}

// MARK: - Another constructor

extension NSEvent {

    static func keyEvent(withEmacsStyle keyString: String) -> NSEvent? {
        var components = keyString.components(separatedBy: "-")
        guard let lastComponent = components.last else { return nil }

        components.removeLast()

        var flags = NSEvent.ModifierFlags()
        var keyCode: UInt16 = 0

        if let code = SRKeyMap.keyCodeMap[lastComponent.lowercased()] {
            keyCode = code
        } else {
            switch lastComponent.lowercased() {
            case "spc", "space":
                keyCode = SRKeyMap.keyCodeMap[" "]!
            case "ret", "return":
                keyCode = SRKeyMap.keyCodeMap["return"]!
            default:
                return nil
            }
        }

        if lastComponent.count == 1 {
            let lastCharacter = Character(lastComponent)
            if lastCharacter.isUppercase {
                flags.insert(.shift)
            }
        }

        for c in components {
            switch c.lowercased() {
            case "s", "cmd", "command":
                flags.insert(.command)
            case "c", "ctrl", "control":
                flags.insert(.control)
            case "m", "meta", "option":
                flags.insert(.option)
            default:
                return nil
            }
        }

        return NSEvent.keyEvent(with: .keyDown, location: NSPoint(), modifierFlags: flags, timestamp: 0, windowNumber: 0, context: nil, characters: "", charactersIgnoringModifiers: "", isARepeat: false, keyCode: keyCode)!
    }

}

//
//  SilentView.swift
//  SRKeyHandlable
//
//  Created by Heeseung Seo on 10/04/2019.
//  Copyright © 2019 Seorenn. All rights reserved.
//

import Cocoa

public class SilentView: NSView {

    var reservedKeyEvents = [NSEvent]()

    override public var acceptsFirstResponder: Bool {
        return true
    }

    private func isSameKeyEvent(left: NSEvent, right: NSEvent) -> Bool {
        guard left.isKeyEvent && right.isKeyEvent else { return false }
        return left.keyCode == right.keyCode &&
        left.modifierFlags.contains(.control) == right.modifierFlags.contains(.control) &&
        left.modifierFlags.contains(.command) == right.modifierFlags.contains(.command) &&
        left.modifierFlags.contains(.option) == right.modifierFlags.contains(.option) &&
        left.modifierFlags.contains(.shift) == right.modifierFlags.contains(.shift)
    }

    private func isRequired(event: NSEvent) -> Bool {
        for e in reservedKeyEvents {
            if isSameKeyEvent(left: e, right: event) {
                return true
            }
        }
        return false
    }

    override public func performKeyEquivalent(with event: NSEvent) -> Bool {
        return isRequired(event: event)
    }

    override public func keyDown(with event: NSEvent) {
        if isRequired(event: event) == false {
            super.keyDown(with: event)
        }
    }
    
}

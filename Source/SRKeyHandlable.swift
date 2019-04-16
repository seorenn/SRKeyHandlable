//
//  SRKeyHandlable.swift
//  SRKeyHandlable
//
//  Created by Heeseung Seo on 10/04/2019.
//  Copyright © 2019 Seorenn. All rights reserved.
//

import Cocoa

public class SRKeyboardHandler {
    let object: AnyObject
    var keyUpHandler: ((NSEvent) -> ())?
    var keyDownHandler: ((NSEvent) -> ())?

    init(object: AnyObject) {
        self.object = object
    }

    public func keyUp(_ handler: @escaping (NSEvent) -> ()) -> SRKeyboardHandler {
        keyUpHandler = handler
        return self
    }

    public func keyDown(_ handler: @escaping (NSEvent) -> ()) -> SRKeyboardHandler {
        keyDownHandler = handler
        return self
    }

    public func startHandle() {
        assert(keyUpHandler != nil || keyDownHandler != nil, "you must set one of keyUp or keyDown")
        SRKeyboardManager.shared.removeHandlableViewController(object: object)
        SRKeyboardManager.shared.addHandlableViewController(object: object, keyDown: keyDownHandler, keyUp: keyUpHandler)
    }
}

public protocol SRKeyHandlable: class {
    func keyUp(_ handler: @escaping (NSEvent) -> ()) -> SRKeyboardHandler
    func keyDown(_ handler: @escaping (NSEvent) -> ()) -> SRKeyboardHandler
    func stopHandleKeyboard()
}

public extension SRKeyHandlable {

    func keyUp(_ handler: @escaping (NSEvent) -> ()) -> SRKeyboardHandler {
        let h = SRKeyboardHandler(object: self)
        return h.keyUp(handler)
    }

    func keyDown(_ handler: @escaping (NSEvent) -> ()) -> SRKeyboardHandler {
        let h = SRKeyboardHandler(object: self)
        return h.keyDown(handler)
    }

    func stopHandleKeyboard() {
        SRKeyboardManager.shared.removeHandlableViewController(object: self)
    }

}

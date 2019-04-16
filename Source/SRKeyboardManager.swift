//
//  KeyboardManager.swift
//  SRKeyHandlable
//
//  Created by Heeseung Seo on 2016. 9. 13..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa

fileprivate struct SRKeyboardManagerItem {
    let object: AnyObject
    let keyDown: ((NSEvent) -> ())?
    let keyUp: ((NSEvent) -> ())?
}

public class SRKeyboardManager: NSObject {
    public static let shared = SRKeyboardManager()
    private var queue = [SRKeyboardManagerItem]()
    
    public var isEnable: Bool = true
    
    override init() {
        super.init()
        NSEvent.addLocalMonitorForEvents(matching: [NSEvent.EventTypeMask.keyDown, NSEvent.EventTypeMask.keyUp]) { (event) -> NSEvent? in
            self.handleKeyboard(event: event)
            return event
        }
    }
    
    public func handleKeyboard(event: NSEvent) {
        guard self.isEnable, let item = queue.last else { return }
        
        if event.type == .keyDown, let handler = item.keyDown {
            handler(event)
        } else if event.type == .keyUp, let handler = item.keyUp {
            handler(event)
        }
    }
    
    public func addHandlableViewController(object: AnyObject, keyDown: ((NSEvent) -> ())?, keyUp: ((NSEvent) -> ())?) {
        queue.append(SRKeyboardManagerItem(object: object, keyDown: keyDown, keyUp: keyUp))
    }
    
    public func removeHandlableViewController(object: AnyObject) {
        for (index, item) in queue.enumerated() {
            if item.object === object {
                queue.remove(at: index)
            }
        }
    }

}

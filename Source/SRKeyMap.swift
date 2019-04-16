//
//  SRKeyMap.swift
//  SRKeyHandlable
//
//  Created by Heeseung Seo on 2016. 9. 13..
//  Copyright © 2016년 Seorenn. All rights reserved.
//

import Cocoa

public struct SRKeyMap {

    public static let keyCodeMap: [String : UInt16] = [
        "a": 0x00,
        "s": 0x01,
        "d": 0x02,
        "f": 0x03,
        "h": 0x04,
        "g": 0x05,
        "z": 0x06,
        "x": 0x07,
        "c": 0x08,
        "v": 0x09,
        "b": 0x0B,
        "q": 0x0C,
        "w": 0x0D,
        "e": 0x0E,
        "r": 0x0F,
        "y": 0x10,
        "t": 0x11,
        "1": 0x12,
        "2": 0x13,
        "3": 0x14,
        "4": 0x15,
        "6": 0x16,
        "5": 0x17,
        "=": 0x18,      // Equal
        "9": 0x19,
        "7": 0x1A,
        "-": 0x1B,      // Minus
        "8": 0x1C,
        "0": 0x1D,
        ")": 0x1E,      // Right Bracket
        "o": 0x1F,      // Oh, not zero ;-)
        "u": 0x20,
        "(": 0x21,      // Left Bracket
        "i": 0x22,
        "p": 0x23,
        "l": 0x25,
        "j": 0x26,
        "'": 0x27,      // Quote,
        "k": 0x28,
        ";": 0x29,      // Semicolon,
        "\\": 0x2A,     // Backslash,
        ",": 0x2B,      // Comma,
        "/": 0x2C,      // Slash,
        "n": 0x2D,
        "m": 0x2E,
        ".": 0x2F,      // Period,
        // TODO: What is Grave? Tilt?
        //kVK_ANSI_Grave                = 0x32
        // TODO: I have no keypad
        //kVK_ANSI_KeypadDecimal        = 0x41,
        //kVK_ANSI_KeypadMultiply       = 0x43,
        //kVK_ANSI_KeypadPlus           = 0x45,
        //kVK_ANSI_KeypadClear          = 0x47,
        //kVK_ANSI_KeypadDivide         = 0x4B,
        //kVK_ANSI_KeypadEnter          = 0x4C,
        //kVK_ANSI_KeypadMinus          = 0x4E,
        //kVK_ANSI_KeypadEquals         = 0x51,
        //kVK_ANSI_Keypad0              = 0x52,
        //kVK_ANSI_Keypad1              = 0x53,
        //kVK_ANSI_Keypad2              = 0x54,
        //kVK_ANSI_Keypad3              = 0x55,
        //kVK_ANSI_Keypad4              = 0x56,
        //kVK_ANSI_Keypad5              = 0x57,
        //kVK_ANSI_Keypad6              = 0x58,
        //kVK_ANSI_Keypad7              = 0x59,
        //kVK_ANSI_Keypad8              = 0x5B,
        //kVK_ANSI_Keypad9              = 0x5C

        "return": 0x24,
        "tab": 0x30,
        " ": 0x31,      // Space,
        "delete": 0x33,
        "escape": 0x35,
        "command": 0x37,
        "shift": 0x38,
        "capslock": 0x39,
        "option": 0x3A,
        "control": 0x3B,
        "rightshift": 0x3C,
        "rightoption": 0x3D,
        "rightcontrol": 0x3E,
        "function": 0x3F,
        "f17": 0x40,
        "volumeup": 0x48,
        "volumedown": 0x49,
        "mute": 0x4A,
        "f18": 0x4F,
        "f19": 0x50,
        "f20": 0x5A,
        "f5": 0x60,
        "f6": 0x61,
        "f7": 0x62,
        "f3": 0x63,
        "f8": 0x64,
        "f9": 0x65,
        "f11": 0x67,
        "f13": 0x69,
        "f16": 0x6A,
        "f14": 0x6B,
        "f10": 0x6D,
        "f12": 0x6F,
        "f15": 0x71,
        "help": 0x72,
        "home": 0x73,
        "pageup": 0x74,
        "forwarddelete": 0x75,
        "f4": 0x76,
        "end": 0x77,
        "f2": 0x78,
        "pagedown": 0x79,
        "f1": 0x7A,
        "leftarrow": 0x7B,
        "rightarrow": 0x7C,
        "downarrow": 0x7D,
        "uparrow": 0x7E
    ]

    public static func string(keyCode: UInt16) -> String? {
        for (key, value) in SRKeyMap.keyCodeMap {
            if value == keyCode {
                return key
            }
        }
        return nil
    }

}

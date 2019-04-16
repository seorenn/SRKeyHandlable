//
//  SRKeyHandlableTests.swift
//  SRKeyHandlableTests
//
//  Created by Heeseung Seo on 16/04/2019.
//  Copyright © 2019 Seorenn. All rights reserved.
//

import XCTest
@testable import SRKeyHandlable

class SRKeyHandlableTests: XCTestCase {

//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }

//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testEmacsStyle() {
        let e1 = NSEvent.keyEvent(withEmacsStyle: "C-a")!
        XCTAssertTrue(e1.isPressingControlKey)
        XCTAssertEqual(e1.keyString!, "a")

        let e2 = NSEvent.keyEvent(withEmacsStyle: "S-M-A")!
        XCTAssertTrue(e2.isPressingCommandKey)
        XCTAssertTrue(e2.isPressingShiftKey)
        XCTAssertEqual(e2.keyString!, "a")

        let e3 = NSEvent.keyEvent(withEmacsStyle: "SPC")!
        XCTAssertEqual(e3.keyString!, " ")
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

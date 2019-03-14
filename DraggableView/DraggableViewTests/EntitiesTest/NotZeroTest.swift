//
//  NotZeroTest.swift
//  DraggableViewTests
//
//  Created by Rian Putra Mantovani on 14/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import XCTest
@testable import DraggableView

class NotZeroTest: XCTestCase {
    
    func testFloatIsNotZero() {
        let notZero = NotZero(value: 2)
        XCTAssertEqual(notZero!.value, 2)
    }
    
    func testFloatIsZero() {
        let notZero = NotZero(value: 0)
        XCTAssertNil(notZero?.value)
    }
}

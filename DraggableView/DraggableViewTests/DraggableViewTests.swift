//
//  DraggableViewTests.swift
//  DraggableViewTests
//
//  Created by Rian Putra Mantovani on 10/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import XCTest
@testable import DraggableView

class DraggableViewTests: XCTestCase {

    func testViewSnappedToLeft() {
        let vm = ViewModel()
        let lastX: Float = 100.0
        let lastY: Float = 100.0
        let centerX: Float = 100.0
        let centerY: Float = 100.0
        
        let snapped = vm.didEndDragging(lastX, lastY,
                                        centerX, centerY)
        
        XCTAssertEqual(snapped, .left)
    }
    
    func testViewSnappedToRight() {
        let vm = ViewModel()
        let lastX: Float = 100.1
        let lastY: Float = 100.0
        let centerX: Float = 100.0
        let centerY: Float = 100.0
        
        let snapped = vm.didEndDragging(lastX, lastY, centerX, centerY)
        
        XCTAssertEqual(snapped, .right)
    }
    
    func testViewSnappedToTop() {
        let vm = ViewModel()
        let lastX: Float = 24
        let lastY: Float = 25
        let centerX: Float = 100.0
        let centerY: Float = 100.0
        
        let snapped = vm.didEndDragging(lastX, lastY, centerX, centerY)
        
        XCTAssertEqual(snapped, .top)
    }
    
    func testViewSnappedToBottom() {
        let vm = ViewModel()
        let lastX: Float = 24
        let lastY: Float = 175
        let centerX: Float = 100.0
        let centerY: Float = 100.0
        
        let snapped = vm.didEndDragging(lastX, lastY, centerX, centerY)
        
        XCTAssertEqual(snapped, .bottom)
    }
}

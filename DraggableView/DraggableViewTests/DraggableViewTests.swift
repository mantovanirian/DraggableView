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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testViewSnappedToLeft() {
        let vm = ViewModel()
        let lastX: Float = 100.0
        let centerX: Float = 100.0
        
        let snapped = vm.didEndDragging(lastX, centerX)
        
        XCTAssertEqual(snapped, .left)
    }
    
    func testViewSnappedToRight() {
        let vm = ViewModel()
        let lastX: Float = 100.1
        let centerX: Float = 100.0
        
        let snapped = vm.didEndDragging(lastX, centerX)
        
        XCTAssertEqual(snapped, .right)
    }
    
    

}

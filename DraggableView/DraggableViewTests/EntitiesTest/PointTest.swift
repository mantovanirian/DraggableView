//
//  PointTest.swift
//  DraggableViewTests
//
//  Created by Rian Putra Mantovani on 13/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import XCTest
import CoreGraphics
@testable import DraggableView

class PointTest: XCTestCase {
    
    func testCreateFromCGPoint() {
        let cgPoint = CGPoint(x: 1, y: 1)
        let point = Point.create(from: cgPoint)
        XCTAssertEqual(point, Point(x:1, y:1))
    }

}

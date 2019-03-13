//
//  Point.swift
//  DraggableView
//
//  Created by Rian Putra Mantovani on 13/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import Foundation
import CoreGraphics

struct Point {
    let x: Float
    let y: Float
}

extension Point {
    static func create(from point: CGPoint) -> Point {
        return Point(x: Float(point.x), y: Float(point.y))
    }
}

extension Point: Equatable {
    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

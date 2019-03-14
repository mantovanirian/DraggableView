//
//  ViewModel.swift
//  DraggableView
//
//  Created by Rian Putra Mantovani on 10/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import Foundation

enum CoordinatePosition {
    case left
    case right
    case top
    case bottom
}

class ViewModel {
    typealias VerticalDivider = NotZero
    let verticalDivider: Float
    
    init(verticalDivider: Float) {
        self.verticalDivider = verticalDivider
    }
    func didEndDragging(_ lastPoint: Point, _ centerPoint: Point) -> CoordinatePosition {
        guard let verticalDivider = VerticalDivider(value: verticalDivider) else { return useVerticalEdgeOnly(lastPoint, centerPoint) }
        return useAllEdge(lastPoint, centerPoint, verticalDivider: verticalDivider)
    }
    
    private func useVerticalEdgeOnly(_ lastPoint: Point, _ centerPoint: Point) -> CoordinatePosition {
        if lastPoint.x <= centerPoint.x {
            return .left
        } else {
            return .right
        }
    }
    
    private func useAllEdge(_ lastPoint: Point, _ centerPoint: Point, verticalDivider: VerticalDivider) -> CoordinatePosition {
        if lastPoint.y <= centerPoint.y / verticalDivider.value {
            return .top
        } else if lastPoint.y >= centerPoint.y + (centerPoint.y * 1 / verticalDivider.value) {
            return .bottom
        } else if lastPoint.x <= centerPoint.x {
            return .left
        } else {
            return .right
        }
    }
}

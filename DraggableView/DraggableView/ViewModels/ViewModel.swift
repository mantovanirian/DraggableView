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
    
    func didEndDragging(_ lastPoint: Point, _ centerPoint: Point) -> CoordinatePosition {
        
        if lastPoint.y <= centerPoint.y / 2 {
            return .top
        } else if lastPoint.y >= centerPoint.y + (centerPoint.y * 1 / 2) {
            return .bottom
        } else if lastPoint.x <= centerPoint.x {
            return .left
        } else {
            return .right
        }
    }
}

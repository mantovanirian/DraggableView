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
    
    func didEndDragging(_ lastX: Float, _ lastY: Float, _ centerX: Float, _ centerY: Float) -> CoordinatePosition {
        
        if lastY <= centerY / 2 {
            return .top
        } else if lastY >= centerY + (centerY * 1 / 2) {
            return .bottom
        } else if lastX <= centerX {
            return .left
        } else {
            return .right
        }
    }
}

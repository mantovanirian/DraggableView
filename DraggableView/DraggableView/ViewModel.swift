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
}

class ViewModel {
    
    func didEndDragging(_ lastX: Float, _ centerX: Float) -> CoordinatePosition {
        if lastX <= centerX {
            return .left
        } else {
            return .right
        }
    }
}

//
//  NotZero.swift
//  DraggableView
//
//  Created by Rian Putra Mantovani on 15/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import Foundation

struct NotZero {
    let value: Float
    init?(value: Float) {
        guard value != 0 else { return nil }
        self.value = value
    }
}

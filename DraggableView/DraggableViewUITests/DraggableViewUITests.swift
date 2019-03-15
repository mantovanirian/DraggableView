//
//  DraggableViewUITests.swift
//  DraggableViewUITests
//
//  Created by Rian Putra Mantovani on 15/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import XCTest

class DraggableViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    func testDraggableViewToTop() {
        let draggedView = app.getView(withId: "draggableView")
        app.move(element: draggedView, to: .top)
        XCTAssertEqual(draggedView.frame.minY, 0)
    }
    
    func testDraggableViewToBottom() {
        let draggedView = app.getView(withId: "draggableView")
        app.move(element: draggedView, to: .bottom)
        XCTAssertEqual(app.getMaxYPosition(view: draggedView), app.getMaxYPosition(view: app))
    }
    
    func testDraggableViewToLeft() {
        let draggedView = app.getView(withId: "draggableView")
        app.move(element: draggedView, to: .left)
        XCTAssertEqual(draggedView.frame.minX, 0)
    }
    
    func testDraggableViewToRight() {
        let draggedView = app.getView(withId: "draggableView")
        app.move(element: draggedView, to: .right)
        XCTAssertEqual(app.getMaxXPosition(view: draggedView), app.getMaxXPosition(view: app))
    }
}

enum Position {
    case top, bottom, left, right
}

extension XCUIApplication {
    func getView(withId identifier: String) -> XCUIElement {
        return self.otherElements.matching(identifier: "draggableView").firstMatch
    }
    
    func move(element: XCUIElement, to position: Position) {
        let sourceCoordinate: XCUICoordinate = element.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        sourceCoordinate.press(forDuration: 1, thenDragTo: self.coordinate(withNormalizedOffset: getVector(from: position)))
    }
    
    func getMaxYPosition(view: XCUIElement) -> CGFloat {
        return view.frame.maxY
    }
    
    func getMaxXPosition(view: XCUIElement) -> CGFloat {
        return view.frame.maxX
    }
    
    private func getVector(from position: Position) -> CGVector {
        switch position {
        case .top: return CGVector(dx:1, dy:0.3)
        case .bottom: return CGVector(dx:1, dy:1.7)
        case .left: return CGVector(dx:0.3, dy:1)
        case .right: return CGVector(dx: 1.7, dy: 1)
            
        }
    }
}

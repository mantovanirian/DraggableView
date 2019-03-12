//
//  DraggableVIew.swift
//  DraggableView
//
//  Created by Rian Putra Mantovani on 12/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import UIKit

class DraggableVIew: UIView {
    private var panRecognizer: UIPanGestureRecognizer!
    private let viewModel = ViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPanGetureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPanGetureRecognizer()
    }
    
    func setupPanGetureRecognizer() {
        panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragged(_:)))
        self.addGestureRecognizer(panRecognizer)
    }
    
    @objc func dragged( _ panGesture: UIPanGestureRecognizer) {
        let translation = panGesture.translation(in: superview)
        center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
        panGesture.setTranslation(CGPoint.zero, in: self)
        
        if panGesture.state == .ended {
            snappedtoEdge()
        }
    }
    
    private func snappedtoEdge() {
        guard let superview = superview else {
            assertionFailure("Draggableview has no superview")
            return
            
        }
        let coordinatePosition = viewModel.didEndDragging(Float(center.x),
                                                          Float(center.y),
                                                          Float(superview.center.x),
                                                          Float(superview.center.y))
        
        animate(coordinatePosition)
    }
    
    private func animate(_ coordinate: CoordinatePosition) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let `self` = self else { return }
            let newPoint = self.calculateNewCoordinate(coordinate)
            self.layer.position = newPoint
        })
    }
    
    private func calculateNewCoordinate(_ coordinatePosition: CoordinatePosition) -> CGPoint {
        guard let superview = superview else {
            assertionFailure("Draggableview has no superview")
            return CGPoint.zero
        }
        switch coordinatePosition {
        case .top:
            return CGPoint(x: center.x,
                           y: frame.height / 2)
        case .bottom:
            return CGPoint(x: center.x,
                           y: superview.frame.height - (frame.height / 2))
        case .left:
            return CGPoint(x: frame.width / 2,
                           y: center.y)
        case .right:
            return CGPoint(x: superview.frame.width - (frame.width / 2),
                           y: center.y)
        }
        
    }
    

    
}

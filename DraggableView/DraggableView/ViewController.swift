//
//  ViewController.swift
//  DraggableView
//
//  Created by Rian Putra Mantovani on 10/03/19.
//  Copyright © 2019 Rian Putra Mantovani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()

    @IBAction func dragged(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        greenView.center = CGPoint(x: greenView.center.x + translation.x, y: greenView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)

        if sender.state == .ended {
            snappedtoEdge()
        }
    }
    
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func snappedtoEdge() {
        let coordinatePosition = viewModel.didEndDragging(Float(greenView.center.x),
                                                          Float(greenView.center.y),
                                                          Float(self.view.center.x),
                                                          Float(self.view.center.y))
        
        animate(coordinatePosition)
    }
    
    
    private func animate(_ coordinate: CoordinatePosition) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let `self` = self else { return }
            let newPoint = self.calculateNewCoordinate(coordinate)
            self.greenView.layer.position = newPoint
        })
    }
    
    private func calculateNewCoordinate(_ coordinatePosition: CoordinatePosition) -> CGPoint {
        switch coordinatePosition {
        case .top:
            return CGPoint(x: self.greenView.center.x,
                           y: self.greenView.frame.height / 2)
        case .bottom:
            return CGPoint(x: self.greenView.center.x,
                           y: self.view.frame.height - (self.greenView.frame.height / 2))
        case .left:
            return CGPoint(x: self.greenView.frame.width / 2,
                           y: self.greenView.center.y)
        case .right:
            return CGPoint(x: self.view.frame.width - (self.greenView.frame.width / 2),
                           y: self.greenView.center.y)
        }
        
    }


}


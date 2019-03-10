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
                                                          Float(self.view.center.x))
        animate(coordinatePosition)
    }
    
    
    private func animate(_ coordinate: CoordinatePosition) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let `self` = self else { return }
            let xCoordinate = coordinate == .left ? self.greenView.frame.width / 2 : self.view.frame.width - (self.greenView.frame.width / 2)
            self.greenView.layer.position = CGPoint(x: 0 + (xCoordinate), y: self.greenView.center.y)
        })
    }


}


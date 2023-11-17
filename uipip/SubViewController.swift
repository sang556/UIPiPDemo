//
//  SubViewController.swift
//  PipKitTestApp
//
//  Created by KimMoonYoung on 2022/09/06.
//

import UIKit
import PIPKit

class SubViewController: UIViewController, PIPUsable {
    
    var initialState: PIPState { return .pip }
    var pipSize: CGSize { return CGSize(width: 400.0, height: 200.0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1.0
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if PIPKit.isPIP {
            stopPIPMode()
        } else {
            startPIPMode()
        }
    }
    
    func didChangedState(_ state: PIPState) {
        switch state {
        case .pip:
            print("PIPViewController.pip")
        case .full:
            print("PIPViewController.full")
        }
    }
    
}

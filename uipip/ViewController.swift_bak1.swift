//
//  PipKitViewController.swift
//  PipKitTestApp
//
//  Created by KimMoonYoung on 2022/09/06.
//

import UIKit
import PIPKit
import AVKit

class ViewController: UIViewController {
    
    private var cancellables: Any?
    
    @objc
    private func onDismiss(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pipKit_On1(_ sender: UIButton) {
        print("PIPKit.isAVPIPKitSupported:",PIPKit.isAVPIPKitSupported)
        PIPKit.show(with: PIPViewController())
        print("PIPKit.isActive:",PIPKit.isActive)
    }
    @IBAction func pipKit_On(_ sender: UIButton) {
//        guard #available(iOS 15.0, *), isAVKitPuppIPSorted else {
//            print("AVPIPKit not supported")
//            return
//        }
//        
//        var cancellables = Set<AnyCancellable>()
//        exitPublisher
//            .sink(receiveValue: {
//                print("exit")
//            })
//            .store(in: &cancellables)
//        
//        self.cancellables = cancellables
        startPictureInPicture()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "PIPKit"
        view.backgroundColor = .gray
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1.0
      
    }
}

class PIPViewController: UIViewController, PIPUsable {
    
    var initialState: PIPState { return .pip }
    var pipSize: CGSize { return CGSize(width: 400.0, height: 200.0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1.0
        
        if PIPKit.isPIP {
            stopPIPMode()
            print("PIPKit.stopPIPMode():",PIPKit.isActive)
        } else {
            startPIPMode()
            print("PIPKit.startPIPMode():",PIPKit.isActive)
        }
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

@available(iOS 15.0, *)
extension ViewController: AVPIPUIKitUsable {
    
    var renderPolicy: AVPIPKitRenderPolicy {
        .once
    }
    
    var pipTargetView: UIView {
        view
    }
    
}

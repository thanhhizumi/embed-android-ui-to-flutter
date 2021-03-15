//
//  ViewController.swift
//  Runner
//
//  Created by Thanh Nam Nguyen on 13/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var channel = FlutterMethodChannel()
    var tappedSendSignalToFlutterDelegate: TappedSendSignalToFlutterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendSignalToFlutter(_ sender: Any) {
        sendFromNative()
    }
    
    func sendFromNative() {
        tappedSendSignalToFlutterDelegate?.sendSignal()
    }
    
    func receiveFromFlutter(text: String) {
        
    }
    
}

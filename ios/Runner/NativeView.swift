//
//  NativeView.swift
//  Runner
//
//  Created by Thanh Nam Nguyen on 15/03/2021.
//

import Foundation

class NativeView: UIView {
    let controller = ViewController()
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //common func to init our view
    private func setupView() {
        self.addSubview(controller.view)
        controller.view.frame = self.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

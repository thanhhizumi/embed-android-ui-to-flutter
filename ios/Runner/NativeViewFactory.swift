//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Thanh Nam Nguyen on 15/03/2021.
//

import Foundation
import Flutter
import UIKit

protocol TappedSendSignalToFlutterDelegate{
    func sendSignal()
}


public class NativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
    }
    
    public func create(withFrame frame: CGRect,
                       viewIdentifier viewId: Int64,
                       arguments args: Any?) -> FlutterPlatformView {
        return NativePlatformView(messenger: messenger,
                                  frame: frame,
                                  viewId: viewId,
                                  args: args)
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

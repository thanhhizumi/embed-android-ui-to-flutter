//
//  NativeView.swift
//  Runner
//
//  Created by Thanh Nam Nguyen on 15/03/2021.
//

import Foundation

// MagicPlatformView.swift
public class NativePlatformView: NSObject, FlutterPlatformView, TappedSendSignalToFlutterDelegate {
    
    func sendSignal() {
        print("Sending data to flutter")
        channel.invokeMethod("sendFromNative", arguments: "native iOS signal!")
    }
    
    let viewId: Int64
    let nativeView = NativeView()
    let messenger: FlutterBinaryMessenger
    let channel: FlutterMethodChannel
    
    init(messenger: FlutterBinaryMessenger,
         frame: CGRect,
         viewId: Int64,
         args: Any?) {
        self.messenger = messenger
        self.viewId = viewId
        channel = FlutterMethodChannel(name: "NativeView/\(viewId)",
                                       binaryMessenger: messenger)
        channel.setMethodCallHandler({ (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "sendFromFlutter":
                guard let args = call.arguments as? [String: Any],
                      let text = args["text"] as? String else {
                    //result(FlutterError(code: "-1", message: "Error"))
                    return
                }
                print(text)
                //self.magicView.receiveFromFlutter(text)
                result("receiveFromFlutter success")
            default:
                result(FlutterMethodNotImplemented)
            }
        })
        super.init()
        nativeView.controller.tappedSendSignalToFlutterDelegate = self
    }
    
    
    
    public func view() -> UIView {
        return nativeView
    }
}

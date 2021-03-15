//
//  NativeViewPlugin.swift
//  Runner
//
//  Created by Thanh Nam Nguyen on 15/03/2021.
//

import Foundation
public class NativeViewPlugin {
    class func register(with registrar: FlutterPluginRegistrar) {
        let viewFactory = NativeViewFactory(messenger: registrar.messenger())
        registrar.register(viewFactory, withId: "NativePlatformView")
    }
}

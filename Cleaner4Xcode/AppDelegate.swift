    //
    //  AppDelegate.swift
    //  Cleaner4Xcode
    //
    //  Created by Baye Wayly on 2019/9/23.
    //  Copyright © 2019 Baye. All rights reserved.
    //

import Cocoa
import SwiftUI

    //@main
    //struct Cleaner4XcodeApp: App {
    //    var body: some Scene {
    //        WindowGroup {
    //            ContentView()
    //        }
    //    }
    //}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
        let mainScreen: NSScreen = NSScreen.screens[0]
        
        // Create the window and set the content view.
        window = NSWindow(
            contentRect: mainScreen.frame,
            styleMask: [
                .titled,
                .closable,
                .miniaturizable,
                .resizable,
                .fullSizeContentView,
                .borderless
            ],
            backing: .buffered, defer: false)
        window.titlebarAppearsTransparent = true
        window.titleVisibility = .hidden
        window.center()
        window.setFrameAutosaveName("Cleaner for Xcode")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
            // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}

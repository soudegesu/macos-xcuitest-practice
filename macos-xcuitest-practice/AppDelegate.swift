//
//  AppDelegate.swift
//  macos-xcuitest-practice
//
//  Created by soudegesu on 2021/11/14.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  var window: NSWindow!
  
  var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
  private let popover = NSPopover()

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Create the SwiftUI view that provides the window contents.
    let contentView = ContentView()

    // Create the window and set the content view.
    window = NSWindow(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
        backing: .buffered, defer: false)
    window.isReleasedWhenClosed = false
    window.center()
    window.setFrameAutosaveName("Main Window")
    window.contentView = NSHostingView(rootView: contentView)
    window.makeKeyAndOrderFront(nil)
    
    statusItem.button?.title = "Sample"
    statusItem.button?.target = self
    statusItem.button?.action = #selector(togglePopover(_:))
    
    popover.behavior = .transient
    popover.contentViewController = NSHostingController(
      rootView: PopoverContent())
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  @objc private func togglePopover(_ sender: AnyObject?) {
    guard let button = statusItem.button else { return }
    if popover.isShown {
      popover.performClose(sender)
    } else {
      popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
      popover.contentViewController?.view.window?.makeKeyAndOrderFront(nil)
    }
  }

}


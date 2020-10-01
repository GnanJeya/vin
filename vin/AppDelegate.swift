//
//  AppDelegate.swift
//  vin
//
//  Created by Ganan Jeyakumar on 29/09/20.
//  Copyright © 2020 Ganan Jeyakumar. All rights reserved.
//

import Cocoa
//import SwiftUI
import Quartz

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    var canQuit: Bool = false

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
    
        let pdfView = VinPDFView()
        let pdfURL = Bundle.main.url(forResource: "vin", withExtension: "pdf")
        let pdfDocument = PDFDocument(url: pdfURL!)
        pdfView.document = pdfDocument
        pdfView.scaleFactor = 1.70
//        pdfView.minScaleFactor = pdfView.scaleFactor
//        pdfView.maxScaleFactor = pdfView.scaleFactor

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .resizable/*, .fullSizeContentView*/],
            backing: .buffered, defer: false)
        window.collectionBehavior = [.fullScreenPrimary]
        window.center()
        window.setFrameAutosaveName("vin")
        window.contentView = pdfView
        window.makeKeyAndOrderFront(nil)
        window.toggleFullScreen(self)
        
        let workspace = NSWorkspace.shared
        workspace.notificationCenter.addObserver(self, selector: #selector(AppDelegate.workspaceWillPowerOff(notification:)), name: NSWorkspace.willPowerOffNotification, object: workspace)
            
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        if (canQuit) {
            return NSApplication.TerminateReply.terminateNow
        } else {
            return NSApplication.TerminateReply.terminateCancel
        }
    }

    @objc func actuallyTerminate(sender: Any) {
        canQuit = true
        NSApplication.shared.terminate(self)
    }
    
    @objc func workspaceWillPowerOff(notification: NSNotification) {
        canQuit = true
    }

}


//struct AppDelegate_Previews: PreviewProvider {
//    static var previews: some View {
//        Text("vin")
//    }
//}

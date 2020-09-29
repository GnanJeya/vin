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

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


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
        window.center()
        window.setFrameAutosaveName("vin")
        window.contentView = pdfView
        window.makeKeyAndOrderFront(nil)
        window.toggleFullScreen(self)
    
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


//struct AppDelegate_Previews: PreviewProvider {
//    static var previews: some View {
//        Text("vin")
//    }
//}

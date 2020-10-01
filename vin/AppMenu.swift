//
//  AppMenu.swift
//  vin
//
//  Created by Ganan Jeyakumar on 1/10/20.
//  Copyright © 2020 Ganan Jeyakumar. All rights reserved.
//

import Cocoa

class AppMenu: NSMenu {

    private lazy var applicationName = ProcessInfo.processInfo.processName
    
    override init(title: String) {
        super.init(title: title)
        
        let mainMenu = NSMenuItem()
        mainMenu.submenu = NSMenu(title: "MainMenu")
        mainMenu.submenu?.addItem(NSMenuItem(title: "About \(applicationName)", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: ""))
        mainMenu.submenu?.addItem(NSMenuItem.separator())
        mainMenu.submenu?.addItem(NSMenuItem(title: "Quit \(applicationName)", action: #selector(AppDelegate.actuallyTerminate(sender:)), keyEquivalent: ""))
        self.addItem(mainMenu)
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

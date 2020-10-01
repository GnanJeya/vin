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
        mainMenu.submenu?.items = [
            NSMenuItem(title: "About \(applicationName)", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)), keyEquivalent: "")
        ]
        self.addItem(mainMenu)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

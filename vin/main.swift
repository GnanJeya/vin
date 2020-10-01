//
//  main.swift
//  vin
//
//  Created by Ganan Jeyakumar on 1/10/20.
//  Copyright © 2020 Ganan Jeyakumar. All rights reserved.
//

import Cocoa

let delegate = AppDelegate()
let menu = AppMenu()
NSApplication.shared.delegate = delegate
NSApplication.shared.menu = menu
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

//
//  AppDelegate.swift
//  BuildInfo
//
//  Created by Eric.Hemmeter on 4/12/19.
//  Copyright © 2019 sneakypockets. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    //Outlets for all the user interaction that we will pull data from
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var techIDField: NSView!
    @IBOutlet weak var techPasswordField: NSBox!
    @IBOutlet weak var assignedIDField: NSTextField!
    @IBOutlet weak var assignedPasswordField: NSTextField!
    @IBOutlet weak var topGunMenu: NSPopUpButton!
    @IBOutlet weak var countryMenu: NSPopUpButton!
    @IBOutlet weak var businessUnitMenu: NSPopUpButton!
    
    @IBAction func cancelButton(_ sender: NSButton) {
    }
    @IBAction func submitButton(_ sender: NSButton) {
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


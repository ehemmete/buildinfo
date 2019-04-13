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
    @IBOutlet weak var emptyFieldsWindow: NSWindow!
    @IBOutlet weak var techIDField: NSTextField!
    @IBOutlet weak var assignedUserField: NSTextField!
    @IBOutlet weak var topGunPopUp: NSPopUpButton!
    @IBOutlet weak var computerNameField: NSTextField!
    @IBOutlet weak var businessUnitPopUp: NSPopUpButton!
    @IBOutlet weak var countryCodePopUp: NSPopUpButton!
    @IBOutlet weak var resetButton: NSButton!
    
    let tagRoot = "/Users/Shared/OrgName"
    
    @IBAction func confirmEmptyFieldsButton(_ sender: NSButton) {
        emptyFieldsWindow.setIsVisible(false)
    }
    
    @IBAction func resetButton(_ sender: NSButton) {
        techIDField.stringValue = ""
        assignedUserField.stringValue = ""
        topGunPopUp.selectItem(withTitle: "None")
        computerNameField.stringValue = ""
        businessUnitPopUp.selectItem(withTitle: "Corporate")
        countryCodePopUp.selectItem(withTitle: "US")
    }
    
    @IBAction func submitButton(_ sender: NSButton) {
        if techIDField.stringValue.isEmpty || assignedUserField.stringValue.isEmpty || computerNameField.stringValue.isEmpty {
            emptyFieldsWindow.setIsVisible(true)
            return
        }
        let techID = techIDField.stringValue
        let assignedUser = assignedUserField.stringValue
        let topGunValue = topGunPopUp.titleOfSelectedItem!
        let computerName = computerNameField.stringValue
        let businessUnit = businessUnitPopUp.titleOfSelectedItem!
        let countryCode = countryCodePopUp.titleOfSelectedItem!
        
        if !(computerName.count >= 8 && computerName.count <= 15) || !computerName.starts(with: "OrgMac") {
            computerNameField.becomeFirstResponder()
            return
        }
        
        
        writeToFile(file: "\(tagRoot)/BuildTech.txt", data: techID)
        writeToFile(file: "\(tagRoot)/AssignedUser.txt", data: assignedUser)
        writeToFile(file: "\(tagRoot)/TopGun.txt", data: topGunValue)
        writeToFile(file: "\(tagRoot)/ComputerName.txt", data: computerName)
        writeToFile(file: "\(tagRoot)/BusinessUnit.txt", data: businessUnit)
        writeToFile(file: "\(tagRoot)/CountryCode.txt", data: countryCode)
        
        exit(0)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        emptyFieldsWindow.setIsVisible(false)
        let fileManager = FileManager.default
        if  !fileManager.fileExists(atPath: tagRoot) {
            do {
                try fileManager.createDirectory(atPath: tagRoot, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Cannot create folder at \(tagRoot)")
            }
        }
        resetButton(resetButton)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    //Write a string to a file
    func writeToFile(file: String, data: String) {
        let fileURL = URL(fileURLWithPath: file)
        do {
            try data.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("Writing \(data) to \(fileURL) failed")
        }
    }

}


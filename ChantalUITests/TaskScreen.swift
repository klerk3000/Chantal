//
//  TaskScreen.swift
//  ChantalUITests
//
//  Created by Андрей Голубев on 05.08.2024.
//  Copyright © 2024 Monte Thakkar. All rights reserved.
//
import Foundation
import XCTest

class TaskScreen {
    let app = XCUIApplication()
    var taskNameField: XCUIElement { app.alerts.textFields.firstMatch }
    var addTaskButton: XCUIElement { app.alerts.scrollViews.otherElements.buttons["Add"] }
    var cancelTaskButton: XCUIElement { app.alerts.scrollViews.otherElements.buttons["Cancel"] }
    
}

//
//  MainScreen.swift
//  ChantalUITests
//
//  Created by Андрей Голубев on 06.08.2024.
//  Copyright © 2024 Monte Thakkar. All rights reserved.
//

import XCTest

struct MainScreen: Screen {
    let app: XCUIApplication
    
    private enum Identifiers {
        static let addButton = "Add"
        static let deleteButton = "delete"
        static let taskCell = "TaskCell"
    }
    
    func tapAddButton() -> AddTaskScreen {
        app.buttons[Identifiers.addButton].tap()
        return AddTaskScreen(app: app)
    }
    
    func deleteTask(at index: Int) {
        app.cells.element(boundBy: index).swipeLeft()
        app.buttons[Identifiers.deleteButton].tap()
    }
    
    func isTaskPresent(_ name: String) -> Bool {
        return app.cells.containing(NSPredicate(format: "label == %@", name)).firstMatch.exists
    }
    
    func taskCount() -> Int {
        return app.cells.count
    }
}

struct AddTaskScreen: Screen {
    let app: XCUIApplication
    
    private enum Identifiers {
        static let textField = "TaskTextField"
        static let addButton = "Add"
    }
    
    func enterTaskName(_ name: String) -> Self {
        app.alerts.textFields.firstMatch.typeText(name)
        return self
    }
    
    func tapAddButton() -> MainScreen {
        app.alerts.scrollViews.otherElements.buttons[Identifiers.addButton].tap()
        return MainScreen(app: app)
    }
}

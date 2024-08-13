//
//  ChantalUITests.swift
//  ChantalUITests
//
//  Created by Андрей Голубев on 26.07.2024.
//  Copyright © 2024 Monte Thakkar. All rights reserved.
//

import XCTest

final class ChantalUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let mainScreen = MainScreen(app: app)
        
        mainScreen.tapAddButton()
            .enterTaskName("Breakfast")
            .tapAddButton()
        
        mainScreen.tapAddButton()
            .enterTaskName("Brunch")
            .tapAddButton()
        
        mainScreen.tapAddButton()
            .enterTaskName("Lunch")
            .tapAddButton()
        
        mainScreen.deleteTask(at: 1)
        
        XCTAssertEqual(mainScreen.taskCount(), 2, "После удаления количество задач должно быть равно 2")
        XCTAssertFalse(mainScreen.isTaskPresent("Brunch"), "Brunch удален")
        
        mainScreen.tapAddButton()
            .enterTaskName("teaParty")
            .tapAddButton()
        
        XCTAssertTrue(mainScreen.isTaskPresent("teaParty"), "teaParty показан")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

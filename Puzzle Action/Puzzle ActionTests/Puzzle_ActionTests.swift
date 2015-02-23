//
//  Puzzle_ActionTests.swift
//  Puzzle ActionTests
//
//  Created by Boolky Bear on 17/2/15.
//  Copyright (c) 2015 ByBDesigns. All rights reserved.
//

import UIKit
import XCTest

class Puzzle_ActionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

class Puzzle_Action_GameStateTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}
	
	func testDifficulty()
	{
		var initialDifficulty = Difficulty()
		XCTAssert(initialDifficulty.difficulty == 0, "Default difficulty should be 0")
		
		var difficultyCopy = initialDifficulty.increaseDifficulty()
		XCTAssert(initialDifficulty.difficulty == 1, "Initial difficulty should be 1")
		XCTAssert(difficultyCopy.difficulty == 1, "Copy of difficulty should be 1")
		
		initialDifficulty.increaseDifficulty()
		
		XCTAssert(initialDifficulty.difficulty == 2, "Initial difficulty should be 2")
		XCTAssert(difficultyCopy.difficulty == 1, "Copy of difficulty should be 1")
		
		difficultyCopy.decreaseDifficulty()
		XCTAssert(difficultyCopy.difficulty == 0, "Copy of difficulty should be 0")
		
		difficultyCopy.decreaseDifficulty()
		XCTAssert(difficultyCopy.difficulty == 0, "Copy of difficulty should still be 0")
	}
	
	func testGameState()
	{
		var initialState = GameState()
		XCTAssert(initialState.livesCount == 3, "Initially you should have 3 lives")
		
		var stateCopy = initialState
		initialState.addOneLife()
		XCTAssert(initialState.livesCount == 4, "Initial state should have 4 lives")
		XCTAssert(stateCopy.livesCount == 3, "State copy should have 3 lives")
		
		XCTAssert(stateCopy.takeOneLife(), "State copy should return true")
		stateCopy.takeOneLife()
		XCTAssertFalse(stateCopy.takeOneLife(), "State copy should return false")
	}
}

//
//  PeopleCountScene.swift
//  Puzzle Action
//
//  Created by Boolky Bear on 17/2/15.
//  Copyright (c) 2015 ByBDesigns. All rights reserved.
//

import UIKit
import SpriteKit

class PeopleCountScene: SKScene {
	
	var initialDifficulty: Difficulty
	var gameState: GameState
	
	var carNodes: [Car]
	var puzzleState: PuzzleState
	
	enum SceneState
	{
		case Initial
		case Setup
		case PassingForward(NSDate)
		case Solving(NSDate)
		case PassingBackwards(NSDate)
		case Solved(Int)
		case Dead
		case Finished
	}
	
	struct PuzzleState
	{
		var sceneState: SceneState = .Initial
		
		let puzzlesToSolve: Int
		let puzzlesSolved: Int = 0
		
		init(difficulty: Difficulty)
		{
			self.puzzlesToSolve = difficulty.difficulty + 3	// or any other function ...
		}
	}
	
	class Car: SKNode {
		
		let peopleCount: Int = 0
		
		init(people: Int)
		{
			self.peopleCount = people
			
			super.init()
			
			let backgroundNode = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 200, height: 100))
			backgroundNode.position = CGPointZero
			backgroundNode.zPosition = 0
			self.addChild(backgroundNode)
			for i in 1...people
			{
				let personNode = SKSpriteNode(color: UIColor.yellowColor(), size: CGSize(width: 40, height: 80))
				personNode.position = CGPoint(x: random() % (200-40), y: 10 + (random() % 10))
				personNode.zPosition = CGFloat(i)
				backgroundNode.addChild(personNode)
			}
		}

		required init?(coder aDecoder: NSCoder) {
		    fatalError("init(coder:) has not been implemented")
		}
	}
	
	required init(gameState: GameState, difficulty: Difficulty, size: CGSize = CGSize(width: 480, height: 320))
	{
		self.gameState = gameState
		self.initialDifficulty = difficulty
		
		self.carNodes = [Car]()
		self.puzzleState = PuzzleState(difficulty: difficulty)
		
		super.init(size: size)
		
		self.backgroundColor = SKColor.whiteColor()
		self.scaleMode = .AspectFit
	}
	
	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func didMoveToView(view: SKView) {
	}
}

func < (lhs: NSDate, rhs: NSDate) -> Bool
{
	return rhs.timeIntervalSinceDate(lhs) > 0
}

// SKScene
extension PeopleCountScene
{
	override func update(currentTime: NSTimeInterval) {
		switch self.puzzleState.sceneState
		{
		case .Initial:
			self.puzzleState.sceneState = .Setup
			
		case .Setup:
			let duration = self.createScene(self.initialDifficulty)
			self.puzzleState.sceneState = .PassingForward(NSDate(timeInterval: duration, sinceDate: NSDate()))
			
		case .PassingForward(let untilDate):
			let now = NSDate()
			if untilDate < now
			{
				let duration = self.solveTime(self.initialDifficulty)
				self.puzzleState.sceneState = .Solving(NSDate(timeInterval: duration, sinceDate: now))
			}
			
		case .Solving(let untilDate):
			let now = NSDate()
			
			// TODO: update timers
			
			if untilDate < now
			{
				// TODO: store answer
				// TODO: make train go backwards
				self.puzzleState.sceneState = .PassingBackwards(NSDate(timeInterval: 5.0 * NSTimeInterval(self.carNodes.count), sinceDate: now))
			}
			
		case .PassingBackwards(let untilDate):
			let now = NSDate()
			if untilDate < now
			{
				self.puzzleState.sceneState = self.checkAnswer()
			}
			
		case .Solved(let solveCount):
			if solveCount >= self.puzzleState.puzzlesToSolve
			{
				self.puzzleState.sceneState = .Finished
			}
			else
			{
				self.initialDifficulty.increaseDifficulty()
				self.puzzleState.sceneState = .Initial
			}
			
		case .Dead:
			if self.gameState.takeOneLife() == false
			{
				self.puzzleState.sceneState = .Finished
			}
			else
			{
				self.initialDifficulty.decreaseDifficulty()
				self.puzzleState.sceneState = .Initial
			}
			
		case .Finished:
			// TODO: finish scene, continue game if not dead
			break
		}
	}
}

// Helpers
extension PeopleCountScene
{
	func createScene(difficulty: Difficulty) -> NSTimeInterval
	{
		// TODO: Add nodes
		return 20.0
	}
	
	func solveTime(difficulty: Difficulty) -> NSTimeInterval
	{
		// TODO: return time based upon difficulty
		return 10.0
	}
	
	func checkAnswer() -> SceneState
	{
		// TODO: create variables needed to store the answer
		return .Dead
	}
}

//
//  GameState.swift
//  Puzzle Action
//
//  Created by Boolky Bear on 23/2/15.
//  Copyright (c) 2015 ByBDesigns. All rights reserved.
//

import Foundation

struct GameState
{
	var livesCount: Int
	
	init()
	{
		self.livesCount = 3
	}
	
	private mutating func addLives(numberOfLives lives: Int)
	{
		self.livesCount += lives
	}
	
	mutating func addOneLife()
	{
		self.addLives(numberOfLives: 1)
	}
	
	mutating func takeOneLife() -> Bool
	{
		self.addLives(numberOfLives: -1)
		
		return self.livesCount > 0
	}
}

struct Difficulty
{
	var difficulty: Int
	
	init()
	{
		self.difficulty = 0
	}
	
	mutating func increaseDifficulty() -> Difficulty
	{
		self.difficulty += 1
		
		return self
	}
	
	mutating func decreaseDifficulty() -> Difficulty
	{
		if self.difficulty > 0
		{
			self.difficulty -= 1
		}
		
		return self
	}
}
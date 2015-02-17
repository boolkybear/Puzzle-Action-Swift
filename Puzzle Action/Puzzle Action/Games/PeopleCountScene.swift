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
	
}

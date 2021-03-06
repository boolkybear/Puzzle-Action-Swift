//
//  GameViewController.swift
//  Puzzle Action
//
//  Created by Boolky Bear on 17/2/15.
//  Copyright (c) 2015 ByBDesigns. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
	
	var peopleCountToken: dispatch_once_t = 0
	var peopleCountScene: PeopleCountScene? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

		let skView = self.view as SKView
		skView.showsFPS = true
		skView.showsNodeCount = true
		
		/* Sprite Kit applies additional optimizations to improve rendering performance */
		skView.ignoresSiblingOrder = true
		
		/* Set the scale mode to scale to fit the window */
		dispatch_once(&peopleCountToken) {
			self.peopleCountScene = PeopleCountScene(gameState: GameState(), difficulty: Difficulty())
		}
		
		//self.peopleCountScene.scaleMode = .AspectFill
		skView.presentScene(self.peopleCountScene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

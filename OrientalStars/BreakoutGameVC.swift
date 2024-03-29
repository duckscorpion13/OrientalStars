//
//  BreakoutGameVC.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import UIKit

/**
 * The controller that handles events and
 * user input to control the game. Furthermore
 * does it contain the game loop.
 */
class BreakoutGameVC: UIViewController {
	private let settingsModel = SettingsModel()
	private var loaded: Bool = false
	private(set) var game: BreakoutGame!
	override var prefersStatusBarHidden: Bool {
		get { return true }
	}
	
	private var displayLink: CADisplayLink!
	private var tps = 60
	private var tickDelay: TimeInterval!
	private var lastTick = Date()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //支持多点触摸
        self.view.isMultipleTouchEnabled = true
    }
    
	override func viewWillAppear(_ animated: Bool) {
		if (!loaded) {
			game = BreakoutGame(controller: self, initialBallSpeed: 9, initialBallCount: 1)
			game.testModeEnabled = settingsModel.testModeEnabled
			game.backgroundImage = settingsModel.backgroundImage
			
			// Initialize gameloop
			
			tickDelay = 1.0 / Double(tps)
			displayLink = CADisplayLink(target: self, selector: #selector(gameLoop))
			displayLink.add(to: .main, forMode: .commonModes)
			loaded = true
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pt = touch.location(in: view)
            if(pt.y > self.view.bounds.height/2) {
                game.paddle.moveTo(x: pt.x)
            } else {
                game.paddleSub.moveTo(x: pt.x)
            }
        }
    }
	
	@objc private func gameLoop() {
		if !view.isHidden {
			let now = Date()
			if now.timeIntervalSince(lastTick) > tickDelay {
				game.tick()
				lastTick = now
			}
			
			view.setNeedsDisplay()
		}
	}
	
	@IBAction
	func returnToGame(sender: UIStoryboardSegue) {}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		(segue.destination as? SettingsNavigationController)?.settings?.setModel(settingsModel)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}


//
//  GameView.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class GameView: UIView {
	private var game: BreakoutGame!
	
	func setGame(_ game: BreakoutGame) {
		self.game = game
	}
	
	override func draw(_ rect: CGRect) {
		guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
		game.render(to: context)
	}
}

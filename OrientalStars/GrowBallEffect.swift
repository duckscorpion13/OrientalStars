//
//  GrowBallEffect.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class GrowBallEffect: BallEffect {
	let growFactor: CGFloat
	override var color: UIColor {
		get { return UIColor.orange }
	}
	
	init(growFactor: CGFloat) {
		self.growFactor = growFactor
	}
	
	override func apply(to ball: Ball) {
		ball.grow(byFactor: growFactor)
	}
	
	override func remove(from ball: Ball) {
		ball.shrink(byFactor: growFactor)
	}
}

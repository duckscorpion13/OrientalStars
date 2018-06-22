//
//  BallEffect.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

/**
 * The base class for removable ball effects.
 * Does nothing when applied.
 */
class BallEffect: Hashable {
	var hashValue: Int = randomInt() // Unique per instance
	var color: UIColor {
		get { return UIColor.white }
	}
	
	func apply(to ball: Ball) {}
	
	func remove(from ball: Ball) {}
	
	static func ==(lhs: BallEffect, rhs: BallEffect) -> Bool {
		return lhs === rhs
	}
}

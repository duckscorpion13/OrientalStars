//
//  BallCollision.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import CoreGraphics

/**
 * A collision between a ball and
 * another collidable object.
 */
protocol BallCollision {
	func perform(ball: Ball, collidable: BallCollidable!)
}

class InvertXCollision: BallCollision {
	func perform(ball: Ball, collidable: BallCollidable!) {
		ball.velocity.invertXMutate()
	}
}

class InvertYCollision: BallCollision {
	func perform(ball: Ball, collidable: BallCollidable!) {
		ball.velocity.invertYMutate()
	}
}

class InvertCollision: BallCollision {
	func perform(ball: Ball, collidable: BallCollidable!) {
		ball.velocity.invertMutate()
	}
}

class VelocitySwapCollision: BallCollision {
	func perform(ball: Ball, collidable: BallCollidable!) {
		var mutableCollidable: BallCollidable! = collidable
		let ballVelocity: CGVector = ball.velocity
		
		ball.velocity = collidable.velocity
		mutableCollidable.velocity = ballVelocity
	}
}

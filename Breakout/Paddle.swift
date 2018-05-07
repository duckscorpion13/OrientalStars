//
//  Paddle.swift
//  Breakout
//
//  Created by Fredrik on 03.04.18.
//  Copyright © 2018 fwcd. All rights reserved.
//

import Foundation
import CoreGraphics

/**
 * The object that the player can steer to
 * control the game.
 */
class Paddle: Rectangular, BallCollidable, Rendereable {
	private(set) var bounds: CGRect
    var currentWidth: CGFloat
	var velocity: CGVector = CGVector(dx: 0, dy: 0)
	let color: CGColor
    private var effects = [PaddleEffect : DateSpan]()
	var pos: CGPoint {
		get { return bounds.origin }
	}
	
	init(centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat, color: CGColor) {
		bounds = CGRect(x: centerX - (width / 2), y: centerY - (height / 2), width: width, height: height)
        self.currentWidth = width
		self.color = color
	}
	
    func add(effect: PaddleEffect, forSeconds sec: Double) {
        effects[effect] = DateSpan(start: Date(), duration: sec)
        effect.apply(to: self)
    }
    
	func render(to context: CGContext) {
		context.setFillColor(color)
        
		context.fill(bounds)
	}
	
	func collisionWith(ball: Ball) -> BallCollision? {
		return collisionOf(rect: self, withMovingCircle: ball)
	}
	
	func moveTo(x: CGFloat) {
		bounds = CGRect(x: x - (bounds.width / 2), y: bounds.minY, width: bounds.width, height: bounds.height)
	}
	
	func destroyUponHit() -> Bool {
		// Paddle can not be destroyed by the ball
		return false
	}
    
    func grow(byFactor factor: CGFloat)
    {
        self.currentWidth += factor
        bounds = CGRect(x: pos.x - factor/2, y: pos.y, width: self.currentWidth, height: bounds.height)
    }
    
    func shrink(byFactor factor: CGFloat)
    {
        self.currentWidth -= factor
        bounds = CGRect(x: pos.x + factor/2, y: pos.y, width: self.currentWidth, height: bounds.height)
    }
    
    func update() {
        for (effect, timeSpan) in effects {
            if timeSpan.hasPassed() {
                effect.remove(from: self)
                effects.removeValue(forKey: effect)
            }
        }
    }
}

//
//  BasicBrick.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

/**
 * A basic brick that is immediately destroyed
 * upon being hit.
 */
class BasicBrick: Brick {
	var velocity: CGVector = CGVector(dx: 0, dy: 0)
	var bounds: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
	var game: BreakoutGame!
	var gridPosition: GridPosition!
    let rand = randomInt()%4 + 1
    
	func setGame(_ game: BreakoutGame) {
		self.game = game
	}
	
	func placeIn(bounds: CGRect) {
		self.bounds = bounds
	}
	
	func placeAt(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
		bounds = CGRect(x: x, y: y, width: width, height: height)
	}
	
	func move(by vec: CGVector) {
		bounds = bounds.offsetBy(dx: vec.dx, dy: vec.dy)
	}
	
	func getColor() -> CGColor {
		return UIColor.yellow.cgColor
	}
	
    func getImage() -> CGImage? {
       
        if let img = UIImage(named: "monster\(rand)") {
            return img.cgImage
        }
        return nil
    }
    
	func render(to context: CGContext) {
//        context.setFillColor(getColor())
        context.setFillColor(UIColor.clear.cgColor)
		context.fill(bounds)
        if let cg = getImage() {
            context.draw(cg, in: bounds)
        }
    }
	
	func collisionWith(ball: Ball) -> BallCollision? {
		return collisionOf(rect: self, withMovingCircle: ball)
	}
	
	func onHit(ball: Ball) {
		// Do nothing by default
	}
	
	func destroyUponHit() -> Bool {
		return true
	}
	
	func affectsLevelCounter() -> Bool {
		return true
	}
}

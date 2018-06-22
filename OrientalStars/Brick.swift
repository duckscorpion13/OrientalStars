//
//  Brick.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

/**
 * A rectangular object in the game
 * that responds to collisions with balls.
 */
protocol Brick: Rectangular, BallCollidable, Rendereable {
	var gridPosition: GridPosition! { get set }
	
	func setGame(_ game: BreakoutGame)
	
	func placeIn(bounds: CGRect)
	
	func placeAt(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
	
	func move(by vec: CGVector)
	
	func getColor() -> CGColor
	
	/**
	 * Whether the brick is required to
	 * be destroyed to complete the level.
	 */
	func affectsLevelCounter() -> Bool
}

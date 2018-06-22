//
//  Level.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import CoreGraphics

/**
 * A state of the game that encapsulates how many
 * layers and which bricks should be used.
 */
protocol Level: Moveable, Rendereable {
	var bricks: [Brick] { get }
	var nextLevel: Level? { get }
	var yBricks: Int { get }
	
	func destroyBrick(at index: Int)
	
	func filterBricks(_ filter: (Brick) -> Bool)
	
	func addBrick(in bounds: CGRect, with game: BreakoutGame, at gridPos: GridPosition)
	
	func sampleItem() -> Item
	
	func isCompleted() -> Bool
}

//
//  BasicLevel.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import CoreGraphics

/**
 * A template implementation of Level.
 */
class BasicLevel: Level {
	/**
	 * Bricks should never be mutated without
	 * appropriately modifiying the brickCounter!!
	 */
	private(set) var bricks = [Brick]()
	var nextLevel: Level? {
		get { return nil }
	}
	var yBricks: Int {
		get { return 4 }
	}
	private var brickCounter: Int = 0
	
	func destroyBrick(at index: Int) {
		let brick = bricks.remove(at: index)
		if (brick.affectsLevelCounter()) {
			brickCounter -= 1
		}
	}
	
	func filterBricks(_ isIncluded: (Brick) -> Bool) {
		for (i, brick) in bricks.enumerated().reversed() {
			if !isIncluded(brick) {
				brickCounter -= 1
				bricks.remove(at: i)
			}
		}
	}
	
	func addBrick(in bounds: CGRect, with game: BreakoutGame, at gridPos: GridPosition) {
        if let _brick = sampleBrick() {
            var brick = _brick
            brick.gridPosition = gridPos
            brick.setGame(game)
            brick.placeIn(bounds: bounds)
            bricks.append(brick)
            if (brick.affectsLevelCounter()) {
                brickCounter += 1
            }
        }
	}
	
	func sampleItem() -> Item {
		print("Warning: sampleItem() is not implemented by the current level")
		return BasicItem()
	}
	
	func sampleBrick() -> Brick? {
		return BasicBrick()
	}
	
	func move(by vec: CGVector) {
		for brick in bricks {
			brick.move(by: vec)
		}
	}
	
	func render(to context: CGContext) {
		for brick in bricks {
			brick.render(to: context)
		}
	}
	
	func isCompleted() -> Bool {
		return brickCounter <= 0
	}
}

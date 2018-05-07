//
//  Level1.swift
//  Breakout
//
//  Created by Fredrik on 04.04.18.
//  Copyright © 2018 fwcd. All rights reserved.
//

import Foundation

class Level1: BasicLevel {
	override var yBricks: Int {
		get { return 2 }
	}
	override var nextLevel: Level? {
		get { return Level2() }
	}
	
	override func sampleBrick() -> Brick? {
		switch randomInt(from: 0, to: 4) {
        case 0:
            return nil
        case 1:
			return ItemBrick(item: sampleItem())
		default:
            return BasicBrick()//ItemBrick(item:GrowPaddleItem())
		}
	}
	
	override func sampleItem() -> Item {
		return SpawnBallItem()
	}
}

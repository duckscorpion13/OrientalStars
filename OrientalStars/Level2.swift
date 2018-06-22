//
//  Level2.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation

class Level2: BasicLevel {
	override var yBricks: Int {
		get { return 4 }
	}
	override var nextLevel: Level? {
		get { return Level3() }
	}
	
	override func sampleBrick() -> Brick? {
		switch randomInt(from: 0, to: 6) {
        case 0:
            return nil
		case 1:
			return HardBrick(resistance: 2)
		case 2:
			return ItemBrick(item: sampleItem())
		default:
			return BasicBrick()
		}
	}
	
	override func sampleItem() -> Item {
		switch randomInt(from: 0, to: 2) {
		case 0:
			return GrowBallItem()
		default:
			return SpawnBallItem()
		}
	}
}

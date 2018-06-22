//
//  Level3.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation

class Level3: BasicLevel {
	override var yBricks: Int {
		get { return 6 }
	}
	override var nextLevel: Level? {
		get { return Level3() } // TODO: Replace with next level as soon as it is available
	}
	
	override func sampleBrick() -> Brick? {
		switch randomInt(from: 0, to: 14) {
        case 0:
            return nil
		case 1:
			return ExplodingBrick(radius: 1)
		case 2:
			return HardBrick(resistance: 4)
		case 3:
			return HardBrick(resistance: 3)
		case 4:
			return HardBrick(resistance: 2)
		case 5:
			return ItemBrick(item: sampleItem())
        case 6:
            return UnbreakableBrick()
		default:
			return BasicBrick()
		}
	}
	
	override func sampleItem() -> Item {
		switch randomInt(from: 0, to: 3) {
		case 0:
			return GrowBallItem()
        case 1:
            return SpawnBallItem()
        case 2:
            return GrowPaddleItem()
		default:
			return BasicItem()
		}
	}
}

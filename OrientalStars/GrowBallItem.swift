//
//  GrowBallItem.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class GrowBallItem: BasicItem {
	override func loadTexture() -> UIImage? {
		return #imageLiteral(resourceName: "GrowBallItemTexture")
	}
	
	override func onPickUp() {
		game.addToAllBalls(effect: GrowBallEffect(growFactor: 1.2), forSeconds: 5)
	}
}

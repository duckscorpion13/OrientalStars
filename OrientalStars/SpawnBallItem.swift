//
//  SpawnBallItem.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class SpawnBallItem: BasicItem {
	override func loadTexture() -> UIImage? {
		return #imageLiteral(resourceName: "SpawnBallItemTexture")
	}
	
	override func onPickUp() {
		game.spawnBall()
	}
}

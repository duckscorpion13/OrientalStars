//
//  ItemBrick.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

/**
 * A brick that spawns an item upon being hit.
 */
class ItemBrick: BasicBrick {
	private let item: Item
	
	init(item: Item) {
		self.item = item
	}
	
	override func getColor() -> CGColor {
		return UIColor.cyan.cgColor
	}
	
    override func getImage() -> CGImage? {
        if let img = UIImage(named: "treasure") {
            return img.cgImage
        }
        return nil
    }
    
	override func onHit(ball: Ball) {
		item.place(at: pos, withSpeed: 2, andRadius: game.bounds.width * 0.1)
		item.setGame(game)
		game.items.append(item)
	}
	
	override func destroyUponHit() -> Bool {
		return true
	}
	
	override func affectsLevelCounter() -> Bool {
		return true
	}
}

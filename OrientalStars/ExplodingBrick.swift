//
//  ExplodingBrick.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class ExplodingBrick: BasicBrick {
	private let radius: CGFloat
	
	init(radius: CGFloat) {
		self.radius = radius
	}
	
    override func getImage() -> CGImage? {
        if let img = UIImage(named: "bomb") {
            return img.cgImage
        }
        return nil
    }
    
	override func getColor() -> CGColor {
		return UIColor.orange.cgColor
	}
	
	override func onHit(ball: Ball) {
		game.spawnExplosion(at: gridPosition, withRadius: radius)
	}
	
	override func destroyUponHit() -> Bool {
		return true
	}
	
	override func affectsLevelCounter() -> Bool {
		return true
	}
}

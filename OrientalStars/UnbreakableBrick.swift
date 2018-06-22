//
//  UnbreakableBrick.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

/**
 * A brick that cannot be broken.
 */
class UnbreakableBrick: BasicBrick {

    override func getImage() -> CGImage? {
        if let img = UIImage(named: "dragon") {
            return img.cgImage
        }
        return nil
    }
    
    override func getColor() -> CGColor {
        return UIColor.red.cgColor
    }
	
	override func destroyUponHit() -> Bool {
		return false
	}
	
	override func affectsLevelCounter() -> Bool {
		return false
	}
}

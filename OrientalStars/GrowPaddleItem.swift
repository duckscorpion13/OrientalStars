//
//  GrowPaddleItem.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//


import Foundation
import UIKit

class GrowPaddleItem: BasicItem {
    override func loadTexture() -> UIImage? {
        return #imageLiteral(resourceName: "shuffle")
    }
    
    override func onPickUp() {
        game.addToPaddle(effect: GrowPaddleEffect(growFactor: 20), forSeconds: 10)
    }
}

//
//  GrowPaddleItem.swift
//  Breakout
//
//  Created by DerekYang on 2018/5/7.
//  Copyright © 2018年 fwcd. All rights reserved.
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

//
//  PaddleEffect.swift
//  Breakout
//
//  Created by DerekYang on 2018/5/7.
//  Copyright © 2018年 fwcd. All rights reserved.
//

import Foundation
import UIKit

/**
 * The base class for removable ball effects.
 * Does nothing when applied.
 */
class PaddleEffect: Hashable {
    var hashValue: Int = randomInt() // Unique per instance
    var color: UIColor {
        get { return UIColor.white }
    }
    
    func apply(to Paddle: Paddle) {}
    
    func remove(from Paddle: Paddle) {}
    
    static func ==(lhs: PaddleEffect, rhs: PaddleEffect) -> Bool {
        return lhs === rhs
    }
}

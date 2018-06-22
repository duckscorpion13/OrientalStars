//
//  GrowPaddleEffect.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class GrowPaddleEffect: PaddleEffect {
    let growFactor: CGFloat
    override var color: UIColor {
        get { return UIColor.orange }
    }
    
    init(growFactor: CGFloat) {
        self.growFactor = growFactor
    }
    
    override func apply(to paddle: Paddle) {
        paddle.grow(byFactor: growFactor)
    }
    
    override func remove(from paddle: Paddle) {
        paddle.shrink(byFactor: growFactor)
    }
}

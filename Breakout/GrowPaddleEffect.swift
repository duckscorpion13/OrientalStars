//
//  GrowPaddleEffect.swift
//  Breakout
//
//  Created by DerekYang on 2018/5/7.
//  Copyright © 2018年 fwcd. All rights reserved.
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

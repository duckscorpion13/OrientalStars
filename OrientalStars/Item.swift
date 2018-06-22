//
//  Item.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import CoreGraphics

protocol Item: Circular, Rendereable, BallCollidable {
	func setGame(_ game: BreakoutGame)
	
	func fall()
	
	func collidesWith(paddle: Paddle) -> Bool
	
	func place(at pos: CGPoint, withSpeed speed: CGFloat, andRadius radius: CGFloat)
	
	func onPickUp()
}

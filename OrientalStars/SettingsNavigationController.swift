//
//  SettingsNavigationController.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class SettingsNavigationController: UINavigationController {
	var settings: SettingsViewController? {
		get {
			if childViewControllers.count == 1 {
				return childViewControllers[0] as? SettingsViewController
			} else {
				return nil
			}
		}
	}
}

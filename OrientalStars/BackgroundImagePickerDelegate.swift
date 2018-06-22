//
//  BackgroundImagePickerDelegate.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit

class BackgroundImagePickerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	private let onSelectImage: (UIImage) -> ()
	
	init(onSelectImage: @escaping (UIImage) -> ()) {
		self.onSelectImage = onSelectImage
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		onSelectImage(info[UIImagePickerControllerOriginalImage] as! UIImage)
	}
}

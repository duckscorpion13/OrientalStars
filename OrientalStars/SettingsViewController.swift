//
//  SettingsViewController.swift
//  OrientalStars
//
//  Created by Duck on 2018.06.22
//  Copyright © 2018 All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class SettingsViewController: UITableViewController {
	private var model = SettingsModel()
	private var bgPickerDelegate: BackgroundImagePickerDelegate!
	private var imgPickerController: UIImagePickerController!
	
	@IBOutlet var imgView: UIImageView!
	@IBOutlet var testModeSwitch: UISwitch!
	
	@IBAction func openImagePicker(_ sender: Any) {
		present(imgPickerController, animated: true, completion: nil)
	}
	
	@IBAction func resetBackgroundImage(_ sender: Any) {
		updateImage(with: nil)
	}
	
	func updateImage(with image: UIImage?) {
		imgView.image = image
		imgView.setNeedsDisplay()
	}
	
	func setModel(_ model: SettingsModel) {
		self.model = model
	}
	
	private func syncViewWithModel() {
		imgView.image = model.backgroundImage.value
		testModeSwitch.setOn(model.testModeEnabled.value, animated: false)
	}
	
	private func syncModelWithView() {
		model.backgroundImage.value = imgView.image
		model.testModeEnabled.value = testModeSwitch.isOn
	}
	
	override func viewDidLoad() {
		syncViewWithModel()
		
		bgPickerDelegate = BackgroundImagePickerDelegate(onSelectImage: {(img) -> () in self.onSelectFromImgPicker(image: img)})
		let sourceType = UIImagePickerControllerSourceType.photoLibrary
		let mediaType = String(kUTTypeImage)
		
		if UIImagePickerController.isSourceTypeAvailable(sourceType) && (UIImagePickerController.availableMediaTypes(for: sourceType)?.contains(mediaType) ?? false) {
			imgPickerController = UIImagePickerController()
			imgPickerController.mediaTypes = [mediaType]
			imgPickerController.delegate = bgPickerDelegate
		}
	}
	
	private func onSelectFromImgPicker(image: UIImage) {
		updateImage(with: image)
		imgPickerController.dismiss(animated: true, completion: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.destination is BreakoutGameVC {
			let game: BreakoutGame = (segue.destination as! BreakoutGameVC).game
			let changedTestModeSetting = model.testModeEnabled.value != testModeSwitch.isOn
			
			syncModelWithView()
			
			if changedTestModeSetting || game.isGameOver() {
				game.restart()
			}
		}
	}
}

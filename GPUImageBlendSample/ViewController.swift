//
//  ViewController.swift
//  GPUImageBlendSample
//
//  Created by Tadashi on 2017/06/30.
//  Copyright © 2017 UBUNIFU Incorporated. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		let alphaBlend = AlphaBlend()
		alphaBlend.mix = 0.5

		let input1 = PictureInput(image: UIImage.init(named: "IMAGE1.jpg")!)
		let input2 = PictureInput(image: UIImage.init(named: "IMAGE2.jpg")!)
		let output = PictureOutput()
		output.imageAvailableCallback = {image in
			UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
		}
		input1 --> alphaBlend
		input2 --> alphaBlend --> output

		input1.processImage(synchronously: true)
		input2.processImage(synchronously: true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}


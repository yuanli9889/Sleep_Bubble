//
//  ViewController.swift
//  Sleep Bubble
//
//  Created by Yuan Li on 16/4/21.
//

import UIKit


class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }

   

}


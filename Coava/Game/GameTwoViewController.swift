//
//  GameTwoViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/23.
//

import UIKit

class GameTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backGameTab(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }

}

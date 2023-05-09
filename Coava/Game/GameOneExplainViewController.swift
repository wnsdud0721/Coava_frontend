//
//  GameOneExplainViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/10.
//

import UIKit

class GameOneExplainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backGameOne(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }

}

//
//  GameOneViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/23.
//

import UIKit

class GameOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backGameTab(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func moveGameOneExplain(_ sender: Any) {
        guard let moveLoginPage = self.storyboard?.instantiateViewController(withIdentifier: "GameOneExplainViewController") as? GameOneExplainViewController else {
            return
        }
        moveLoginPage.modalTransitionStyle = .crossDissolve
        moveLoginPage.modalPresentationStyle = .fullScreen
        self.present(moveLoginPage, animated: true)
    }

}

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
    
    @IBAction func moveGameTwoExplain(_ sender: Any) {
        guard let moveLoginPage = self.storyboard?.instantiateViewController(withIdentifier: "GameTwoExplainViewController") as? GameTwoExplainViewController else {
            return
        }
        moveLoginPage.modalTransitionStyle = .crossDissolve
        moveLoginPage.modalPresentationStyle = .fullScreen
        self.present(moveLoginPage, animated: true)
    }

    @IBAction func moveGameScene(_ sender: Any) {
        guard let moveGamePage = self.storyboard?.instantiateViewController(withIdentifier: "GameTwoSceneViewController") as? GameTwoSceneViewController else {
            return
        }
        moveGamePage.modalTransitionStyle = .crossDissolve
        moveGamePage.modalPresentationStyle = .fullScreen
        self.present(moveGamePage, animated: true)
    }
}

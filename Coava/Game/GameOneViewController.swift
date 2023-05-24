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
        guard let moveExplainPage = self.storyboard?.instantiateViewController(withIdentifier: "GameOneExplainViewController") as? GameOneExplainViewController else {
            return
        }
        moveExplainPage.modalTransitionStyle = .crossDissolve
        moveExplainPage.modalPresentationStyle = .fullScreen
        self.present(moveExplainPage, animated: true)
    }

    @IBAction func moveGameScene(_ sender: Any) {
        guard let moveGamePage = self.storyboard?.instantiateViewController(withIdentifier: "GameOneSceneViewController") as? GameOneSceneViewController else {
            return
        }
        moveGamePage.modalTransitionStyle = .crossDissolve
        moveGamePage.modalPresentationStyle = .fullScreen
        self.present(moveGamePage, animated: true)
    }
}

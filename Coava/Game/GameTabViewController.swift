//
//  GameTabViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/23.
//

import UIKit

class GameTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func moveGameOne(_ sender: Any) {
        guard let moveLoginPage = self.storyboard?.instantiateViewController(withIdentifier: "GameOneViewController") as? GameOneViewController else {
            return
        }
        moveLoginPage.modalTransitionStyle = .crossDissolve
        moveLoginPage.modalPresentationStyle = .fullScreen
        self.present(moveLoginPage, animated: true)
    }
    
    @IBAction func moveGameTwo(_ sender: Any) {
        guard let moveLoginPage = self.storyboard?.instantiateViewController(withIdentifier: "GameTwoViewController") as? GameTwoViewController else {
            return
        }
        moveLoginPage.modalTransitionStyle = .crossDissolve
        moveLoginPage.modalPresentationStyle = .fullScreen
        self.present(moveLoginPage, animated: true)
    }

}

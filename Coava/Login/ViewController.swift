//
//  ViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveEmailLogin(_ sender: Any) {
        guard let moveLoginPage = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        moveLoginPage.modalTransitionStyle = .crossDissolve
        moveLoginPage.modalPresentationStyle = .fullScreen
        self.present(moveLoginPage, animated: true)
    }
    
    
}


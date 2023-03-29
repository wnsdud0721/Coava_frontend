//
//  HomeViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func testViewController(_ sender: Any) {
        guard let moveLoginPage = self.storyboard?.instantiateViewController(withIdentifier: "TestViewController") as? testViewController else {
            return
        }
        moveLoginPage.modalTransitionStyle = .crossDissolve
        moveLoginPage.modalPresentationStyle = .fullScreen
        self.present(moveLoginPage, animated: true)
    }
    
    

}

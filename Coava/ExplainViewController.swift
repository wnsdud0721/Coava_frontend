//
//  ExplainViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/28.
//

import UIKit

class ExplainViewController: UIViewController {

    @IBOutlet var explainDetailImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        explainDetailImg.layer.cornerRadius = 10
        explainDetailImg.layer.borderWidth = 0.5
        explainDetailImg.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func backPage(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}

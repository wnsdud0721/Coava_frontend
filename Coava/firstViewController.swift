//
//  firstViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/29.
//

import UIKit

class firstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func tappedSearch(_ sender: Any) {
        let text = "어쩔티비"
                
                if let navigationController = self.navigationController {
                    
                    if !(navigationController.topViewController?.description.contains("secondViewController"))! {
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = storyBoard.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
                        
                        viewController.search = text
                        viewController.url = "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&"
                        
                        navigationController.pushViewController(viewController, animated: true)
                    }
                }
    }
}

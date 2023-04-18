//
//  ButtonChange.swift
//  Coava
//
//  Created by 신재현 on 2023/04/18.
//

import UIKit

class ButtonChange : UIViewController {
    
    var isActive:Bool = false
    
    @IBOutlet weak var ClickChange: UIButton!
    
    @IBAction func ButtonClick(_ sender: Any) {
        if isActive{
            isActive = false
            ClickChange.setImage(UIImage(named: "1.png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

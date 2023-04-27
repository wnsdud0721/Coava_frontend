//
//  ButtonChange.swift
//  Coava
//
//  Created by 신재현 on 2023/04/18.
//

import UIKit

class ButtonChange : UIViewController {
    
    var isActive = false
    
    @IBOutlet weak var ClickChange: UIButton!
    @IBAction func ButtonClick(_ sender: Any) {
    
        if isActive{
            isActive = false
            ClickChange.setImage(UIImage(named: "2(1).png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
        
    }
    
    
    
    @IBOutlet weak var ClickChange1: UIButton!
    @IBAction func ButtonClick1(_ sender: UIButton) {
        if isActive{
            isActive = false
            ClickChange1.setImage(UIImage(named: "2(1).png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange1.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    
    
    @IBOutlet weak var ClickChange2: UIButton!
    @IBAction func ButtonClick2(_ sender: Any) {
        if isActive{
            isActive = false
            ClickChange2.setImage(UIImage(named: "3.png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange2.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

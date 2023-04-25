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
   
    @IBOutlet weak var ClickChange3: UIButton!
    @IBAction func ButtonClick3(_ sender: UIButton) {
        if isActive{
            isActive = false
            ClickChange3.setImage(UIImage(named: "4.png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange3.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    @IBOutlet weak var ClickChange4: UIButton!
    @IBAction func ButtonChange4(_ sender: UIButton) {
        if isActive{
            isActive = false
            ClickChange4.setImage(UIImage(named: "1.png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange4.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    @IBOutlet weak var ClickChange5: UIButton!
    @IBAction func ButtonChange5(_ sender: UIButton) {
        if isActive{
            isActive = false
            ClickChange5.setImage(UIImage(named: "1.png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange5.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    @IBOutlet weak var ClickChange6: UIButton!
    @IBAction func ButtonChange6(_ sender: UIButton) {
        if isActive{
            isActive = false
            ClickChange6.setImage(UIImage(named: "1.png"), for: .normal)
        }
        
        else{
            isActive = true
            ClickChange6.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

//
//  gameCheckViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/05/16.
//

import UIKit

class gameCheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var isActive = false
    var checkSelected = 1
    
    @IBOutlet weak var ClickChange: UIButton!
    @IBAction func ButtonClick(_ sender: Any) {
    
        if isActive && checkSelected == 1{
            isActive = false
            ClickChange.setImage(UIImage(named: "2(1).png"), for: .normal)
        }
        
        else{
            isActive = true
            checkSelected += 1
            ClickChange.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
        
    }
    
    
    
    @IBOutlet weak var ClickChange1: UIButton!
    @IBAction func ButtonClick1(_ sender: UIButton) {
        if isActive && checkSelected == 1{
            isActive = false
            ClickChange1.setImage(UIImage(named: "2(1).png"), for: .normal)
        }
        
        else{
            isActive = true
            checkSelected += 1
            ClickChange1.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
    
    
    @IBOutlet weak var ClickChange2: UIButton!
    @IBAction func ButtonClick2(_ sender: Any) {
        if isActive && checkSelected == 1{
            isActive = false
            ClickChange2.setImage(UIImage(named: "3.png"), for: .normal)
        }
        
        else{
            isActive = true
            checkSelected += 1
            ClickChange2.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }

    @IBOutlet var ClickChange3: UIButton!
    @IBAction func ButtonClick3(_ sender: Any) {
        if isActive && checkSelected == 1{
            isActive = false
            ClickChange3.setImage(UIImage(named: "31.png"), for: .normal)
        }
        
        else{
            isActive = true
            checkSelected += 1
            ClickChange3.setImage(UIImage(named: "Plantshow.png"), for: .normal)
        }
    }
    
}

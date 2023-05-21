//
//  HatViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/10.
//

import UIKit

class HatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var isActive = false
    var checkSelected = 1
    
    @IBOutlet var purchase_1: UIButton!
    @IBAction func purchase_1(_ sender: Any) {
        
        if isActive && checkSelected == 1{
            isActive = false
            purchase_1.setImage(UIImage(named: "Group 249"), for: .normal)
        }

        else{
            isActive = true
            checkSelected += 1
            purchase_1.setImage(UIImage(named: "Group 250"), for: .normal)
        }
        
    }
    

    @IBOutlet var purchase_2: UIButton!
    @IBAction func purchase_2(_ sender: Any) {
        
        if isActive && checkSelected == 1{
            isActive = false
            purchase_2.setImage(UIImage(named: "Group 249"), for: .normal)
        }
        
        else{
            isActive = true
            checkSelected += 1
            purchase_2.setImage(UIImage(named: "Group 250"), for: .normal)
        }
    }
    
    
    @IBOutlet var purchase_3: UIButton!
    @IBAction func purchase_3(_ sender: Any) {
        
        if isActive && checkSelected == 1{
            isActive = false
            purchase_3.setImage(UIImage(named: "Group 249"), for: .normal)
        }
        
        else{
            isActive = true
            checkSelected += 1
            purchase_3.setImage(UIImage(named: "Group 250"), for: .normal)
        }
    }
    
    
}

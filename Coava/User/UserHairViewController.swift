//
//  UserHairViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/12.
//

import UIKit

class UserHairViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonOn = UIImage(named: "wear_basic_1")
        buttonOff = UIImage(named: "wear_hair")
        
        avatar.image = buttonOn
    }
    
    var isActive = false
    
    var buttonOn: UIImage?
    var buttonOff: UIImage?
    
    @IBOutlet var avatar: UIImageView!
    @IBOutlet var wear: UIButton!
    @IBAction func wear(_ sender: Any) {
        
        if wear.isSelected{
            wear.isSelected = false
            avatar.image = buttonOn
        }

        else{
            wear.isSelected = true
            avatar.image = buttonOff
        }
    }
    

}

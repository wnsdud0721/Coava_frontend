//
//  UserGlassesViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/12.
//

import UIKit

class UserGlassesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonOn = UIImage(named: "wear_basic_1")
        buttonOff = UIImage(named: "wear_glasses")
        
        avatar.image = buttonOn
    }
   
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

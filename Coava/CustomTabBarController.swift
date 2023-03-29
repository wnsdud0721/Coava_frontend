//
//  CustomTabBarController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/21.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()

        // Do any additional setup after loading the view.
    }
    
    func setupStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .black, alpha: 0.15, x: 0, y: -2, blur: 8)
    }

}

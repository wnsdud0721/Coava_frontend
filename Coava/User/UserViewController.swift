//
//  UserViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/12.
//

import UIKit
import Tabman
import Pageboy

class UserViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    @IBOutlet var UserTab: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let hatUser = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserHatViewController") as! UserHatViewController
        let glassesUser = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserGlassesViewController") as! UserGlassesViewController
        let hairUser = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserHairViewController") as! UserHairViewController
        
        viewControllers.append(hatUser)
        viewControllers.append(glassesUser)
        viewControllers.append(hairUser)
        
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.backgroundView.style = .clear
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.buttons.customize {(button) in
            button.tintColor = .lightGray
            button.selectedTintColor = UIColor(named: "ClickedColor")
        }
        
        bar.indicator.weight = .medium
        bar.indicator.tintColor = UIColor(named: "ClickedColor")
        bar.indicator.overscrollBehavior = .compress
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 35
        
        
        addBar(bar, dataSource: self, at: .custom(view: UserTab, layout: nil))
    }
    

}

extension UserViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        switch index {
        case 0:
            return TMBarItem(title: "모자")
        case 1:
            return TMBarItem(title: "안경")
        case 2:
            return TMBarItem(title: "머리카락")
        default:
            let title = "Page\(index)"
            return TMBarItem(title: title)
        }
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
}

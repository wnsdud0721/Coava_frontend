//
//  ListViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/29.
//

import UIKit
import Tabman
import Pageboy

class ListViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []

    @IBOutlet var ListTab: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let buzzwordList = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuzzwordListViewController") as! BuzzwordListViewController
        let memeList = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemeListViewController") as! MemeListViewController
        
        viewControllers.append(buzzwordList)
        viewControllers.append(memeList)
        
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
        bar.layout.interButtonSpacing = 0
        
        
        addBar(bar, dataSource: self, at: .custom(view: ListTab, layout: nil))
    }
    

}

extension ListViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
//        let item = TMBarItem(title: "")
//        //item.title = "Page\(index)"
//        item.image = UIImage(named: "catchphrase_basic")
//
//        return item
        
        switch index {
        case 0:
            return TMBarItem(title: "유행어")
        case 1:
            return TMBarItem(title: "밈")
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

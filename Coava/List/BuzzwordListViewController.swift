//
//  BuzzowrdListViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/29.
//

import UIKit

class BuzzwordListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coavabuzzwordlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let buzzword_list_cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buzzword_list_cell", for: indexPath) as! buzzword_list_cell
        
        buzzword_list_cell.setup1(with: coavabuzzwordlist[indexPath.row])
        buzzword_list_cell.coavaBuzzwordListImg.layer.borderColor = UIColor.lightGray.cgColor
        buzzword_list_cell.coavaBuzzwordListImg.layer.borderWidth = 0.5
        buzzword_list_cell.coavaBuzzwordListImg.layer.cornerRadius = 10
        
        buzzword_list_cell.searchButton.superview?.tag = indexPath.section
        buzzword_list_cell.searchButton.tag = indexPath.row
        buzzword_list_cell.searchButton.addTarget(self, action: #selector(self.searchAction), for: .touchUpInside)
        
        
        return buzzword_list_cell
    }
    
    
    @IBOutlet var buzzwordListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buzzwordListCollectionView.delegate = self
        buzzwordListCollectionView.dataSource = self

    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: sender.superview?.tag ?? 0)
            let cell = buzzwordListCollectionView.cellForItem(at: indexPath) as! buzzword_list_cell
            let text = cell.coavaBuzzwordListTitle.text ?? ""
            
            if let navigationController = self.navigationController {
                if !(navigationController.topViewController?.description.contains("BuzzwordWebViewController"))! {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyBoard.instantiateViewController(withIdentifier: "BuzzwordWebViewController") as! BuzzwordWebViewController
                    
                    viewController.search = text
                    viewController.url = "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&"
                    
                    navigationController.pushViewController(viewController, animated: true)
                }
            }
    }
}

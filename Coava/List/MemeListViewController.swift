//
//  MemeListViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/29.
//

import UIKit

class MemeListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coavamemelist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meme_list_cell = collectionView.dequeueReusableCell(withReuseIdentifier: "meme_list_cell", for: indexPath) as! meme_list_cell
        
        meme_list_cell.setup1(with: coavamemelist[indexPath.row])
        meme_list_cell.coavaMemeListImg.layer.borderColor = UIColor.lightGray.cgColor
        meme_list_cell.coavaMemeListImg.layer.borderWidth = 0.5
        meme_list_cell.coavaMemeListImg.layer.cornerRadius = 10
        
        meme_list_cell.searchButton.superview?.tag = indexPath.section
        meme_list_cell.searchButton.tag = indexPath.row
        meme_list_cell.searchButton.addTarget(self, action: #selector(self.searchAction), for: .touchUpInside)
        
        return meme_list_cell
    }
    

    @IBOutlet var memeListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeListCollectionView.delegate = self
        memeListCollectionView.dataSource = self
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: sender.superview?.tag ?? 0)
            let cell = memeListCollectionView.cellForItem(at: indexPath) as! meme_list_cell
            let text = cell.coavaMemeListTitle.text ?? ""
            
            if let navigationController = self.navigationController {
                if !(navigationController.topViewController?.description.contains("MemeWebViewController"))! {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyBoard.instantiateViewController(withIdentifier: "MemeWebViewController") as! MemeWebViewController
                    
                    viewController.search = text
                    viewController.url = "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&"
                    
                    navigationController.pushViewController(viewController, animated: true)
                }
            }
    }
    
}

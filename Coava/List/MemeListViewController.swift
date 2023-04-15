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
        
        return meme_list_cell
    }
    

    @IBOutlet var memeListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeListCollectionView.delegate = self
        memeListCollectionView.dataSource = self
    }
    

}

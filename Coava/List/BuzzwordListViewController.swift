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
        
        return buzzword_list_cell
    }
    
    @IBOutlet var buzzwordListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buzzwordListCollectionView.delegate = self
        buzzwordListCollectionView.dataSource = self

    }
    

   

}

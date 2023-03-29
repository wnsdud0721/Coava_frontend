//
//  BuzzowrdListViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/29.
//

import UIKit

class BuzzwordListViewController: UIViewController {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == buzzwordListCollectionView {
//            return coavabuzzword.count
//        }
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == buzzwordListCollectionView {
//            let buzzwordList_cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buzzwordList_cell", for: indexPath) as! buzzword_cell
//
//            return buzzwordList_cell
//        }
//        return UICollectionViewCell()
//    }
    

    @IBOutlet var buzzwordListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        buzzwordListCollectionView.delegate = self
//        buzzwordListCollectionView.dataSource = self
    }
    

   

}

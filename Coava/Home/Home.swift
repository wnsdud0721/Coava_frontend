//
//  Home.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/24.
//

import UIKit

class Home: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    @IBOutlet var buzzwordCollectionView: UICollectionView!
    @IBOutlet var memeCollectionVIew: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == buzzwordCollectionView {
            return coavabuzzword.count
        }
        
        if collectionView == memeCollectionVIew {
            return coavameme.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == buzzwordCollectionView {
            let buzzword_cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buzzword_cell", for: indexPath)
                as! buzzword_cell
            
            buzzword_cell.setup1(with: coavabuzzword[indexPath.row])
            buzzword_cell.coavaBuzzwordImg.layer.borderColor = UIColor.lightGray.cgColor
            buzzword_cell.coavaBuzzwordImg.layer.borderWidth = 0.5
            buzzword_cell.coavaBuzzwordImg.layer.cornerRadius = 10
            
            return buzzword_cell
        }
        
        if collectionView == memeCollectionVIew {
            let meme_cell = collectionView.dequeueReusableCell(withReuseIdentifier: "meme_cell", for: indexPath)
                as! meme_cell
            
            meme_cell.setup2(with: coavameme[indexPath.row])
            meme_cell.coavaMemeImg.layer.borderColor = UIColor.lightGray.cgColor
            meme_cell.coavaMemeImg.layer.borderWidth = 0.5
            meme_cell.coavaMemeImg.layer.cornerRadius = 10
            
            meme_cell.coavaMemeBackground.layer.borderColor = UIColor.lightGray.cgColor
            meme_cell.coavaMemeBackground.layer.borderWidth = 0.5
            meme_cell.coavaMemeBackground.layer.cornerRadius = 10
            meme_cell.coavaMemeBackground.layer.backgroundColor = UIColor.white.cgColor
            meme_cell.coavaMemeBackground.layer.shadowColor = UIColor.black.cgColor
            meme_cell.coavaMemeBackground.layer.shadowRadius = 5
            meme_cell.coavaMemeBackground.layer.shadowOffset = CGSize(width: 0, height: 0)
            meme_cell.coavaMemeBackground.layer.shadowOpacity = 0.2
            meme_cell.coavaMemeBackground.layer.masksToBounds = false
            
            
            return meme_cell
        }
        
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let moveExplain = self.storyboard?.instantiateViewController(withIdentifier: "ExplainViewController") as? ExplainViewController else {
//            return
//        }
//        moveExplain.modalTransitionStyle = .crossDissolve
//        moveExplain.modalPresentationStyle = .fullScreen
//        self.present(moveExplain, animated: true)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buzzwordCollectionView.delegate = self
        buzzwordCollectionView.dataSource = self
        
        memeCollectionVIew.delegate = self
        memeCollectionVIew.dataSource = self
        
        navigationController?.hidesBarsOnSwipe = false
    }
    


}

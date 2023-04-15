//
//  meme_list_cell.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/15.
//

import UIKit

class meme_list_cell: UICollectionViewCell {
    
    @IBOutlet var coavaMemeListImg: UIImageView!
    @IBOutlet var coavaMemeListTitle: UILabel!
    @IBOutlet var coavaMemeListExplain: UILabel!
    
    func setup1(with coavamemelist: coavaMemeList) {
        coavaMemeListImg.image = coavamemelist.coavaMemeListImg
        coavaMemeListTitle.text = coavamemelist.coavaMemeListTitle
        coavaMemeListExplain.text = coavamemelist.coavaMemeListExplain
    }
}

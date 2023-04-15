//
//  buzzword_list_cell.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/15.
//

import UIKit

class buzzword_list_cell: UICollectionViewCell {
    
    @IBOutlet var coavaBuzzwordListImg: UIImageView!
    @IBOutlet var coavaBuzzwordListTitle: UILabel!
    @IBOutlet var coavaBuzzwordListExplain: UILabel!
    
    func setup1(with coavabuzzwordlist: coavaBuzzwordList) {
        coavaBuzzwordListImg.image = coavabuzzwordlist.coavaBuzzwordListImg
        coavaBuzzwordListTitle.text = coavabuzzwordlist.coavaBuzzwordListTitle
        coavaBuzzwordListExplain.text = coavabuzzwordlist.coavaBuzzwordListExplain
    }
}

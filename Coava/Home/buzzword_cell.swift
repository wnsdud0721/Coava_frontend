//
//  buzzword_cell.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/24.
//

import UIKit

class buzzword_cell: UICollectionViewCell {
    @IBOutlet var coavaBuzzwordImg: UIImageView!
    @IBOutlet var coavaBuzzwordTitle: UILabel!
    @IBOutlet var coavaBuzzwordExplain: UILabel!
    
    func setup1(with coavabuzzword: coavaBuzzword) {
        coavaBuzzwordImg.image = coavabuzzword.coavaBuzzwordImg
        coavaBuzzwordTitle.text = coavabuzzword.coavaBuzzwordTitle
        coavaBuzzwordExplain.text = coavabuzzword.coavaBuzzwordExplain
    }
}

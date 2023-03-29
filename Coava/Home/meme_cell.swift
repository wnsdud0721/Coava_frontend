//
//  meme_cell.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/25.
//

import UIKit

class meme_cell: UICollectionViewCell {
    
    @IBOutlet var coavaMemeImg: UIImageView!
    @IBOutlet var coavaMemeTitle: UILabel!
    @IBOutlet var coavaMemeExplain: UILabel!
    @IBOutlet var coavaMemeBackground: UIImageView!
    
    func setup2(with coavameme: coavaMeme) {
        coavaMemeImg.image = coavameme.coavaMemeImg
        coavaMemeTitle.text = coavameme.coavaMemeTitle
        coavaMemeExplain.text = coavameme.coavaMemeExplain
        coavaMemeBackground.image = coavameme.coavaMemeBackground
    }
    
    
    
    
}

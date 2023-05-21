//
//  coavaMeme.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/25.
//

import Foundation
import UIKit

struct coavaMeme {
    let coavaMemeImg: UIImage
    let coavaMemeTitle: String
    let coavaMemeExplain: String
    let coavaMemeBackground: UIImage
}

let coavameme: [coavaMeme] = [
    coavaMeme(coavaMemeImg: UIImage(named: "이제는 더 이상 물러날 곳이 없다")!, coavaMemeTitle: "이제는 더 이상 물러날 곳이 없다", coavaMemeExplain: "무한도전 프로그램에서 '정준하'가 부른 즉흥곡. 더 이상 물러날 곳이 없는 만큼 위기상황이라는 뜻이다.", coavaMemeBackground: UIImage()),
    //coavaMeme(coavaMemeImg: UIImage(named: "미안하다_이거보여주려고")!, coavaMemeTitle: "미안하다 이거 보여주려고 어그로끌었다", coavaMemeExplain: "특정 제목에 낚여 게시글을 클릭하면 장문의 글이 올라오는 식으로 클릭한 사람을 낚아버리는 과거의 너굴맨, 빅데이터 드립과 비슷한 형식의 드립이다.", coavaMemeBackground: UIImage()),
    coavaMeme(coavaMemeImg: UIImage(named: "귀찮니즘")!, coavaMemeTitle: "귀차니즘", coavaMemeExplain: "'귀찮-'이라는 국어 형용사 어간을 어근 삼아 영어 접미사 '-ism'을 붙여서 만든 신조어", coavaMemeBackground: UIImage()),
    coavaMeme(coavaMemeImg: UIImage(named: "맑은 눈의 광인")!, coavaMemeTitle: "맑은 눈의 광인", coavaMemeExplain: "'맑은 눈'이 포인트지만, 알 수 없는 광기가 느껴지는 사람에게 쓰는 밈", coavaMemeBackground: UIImage()),
    coavaMeme(coavaMemeImg: UIImage(named: "멋지다 연진아")!, coavaMemeTitle: "멋지다 연진아", coavaMemeExplain: "'더 글로리'에서 문동은이 상을 받는 박연진을 비꼬기 위해 말했던 대사가 유행이 되면서 밈이 되었다. 광고나 현수막 문구로도 활용되고 있다.", coavaMemeBackground: UIImage()),
    coavaMeme(coavaMemeImg: UIImage(named: "중요한 건 꺾이지 않는 마음")!, coavaMemeTitle: "중요한 건 꺾이지 않는 마음", coavaMemeExplain: "DRX 소속 Deft선수의 인터뷰 영상의 제목에서 유래. 2022 카타르 월드컵에서 대표팀이 16강전에 올라가고 나서 더 크게 유행하는 밈이 되었다.", coavaMemeBackground: UIImage())
]

//
//  coavaBuzzwordList.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/15.
//

import Foundation
import UIKit

struct coavaBuzzwordList {
    let coavaBuzzwordListImg: UIImage
    let coavaBuzzwordListTitle: String
    let coavaBuzzwordListExplain: String
}

let coavabuzzwordlist: [coavaBuzzwordList] = [
    coavaBuzzwordList(coavaBuzzwordListImg: UIImage(named: "idontknow")!, coavaBuzzwordListTitle: "뭐라고 하는지 1도 모르겠습니다", coavaBuzzwordListExplain: "‘하나도 모르겠다'에서 하나를 1로 변경하여 사용하는 유행어"),
    coavaBuzzwordList(coavaBuzzwordListImg: UIImage(named: "알잘딱깔센")!, coavaBuzzwordListTitle: "알잘딱깔센", coavaBuzzwordListExplain: "'알아서 잘 딱 깔끔하고 센스있게'의 줄임말. 더 줄여서 '알잘딱'이라고도 한다"),
    coavaBuzzwordList(coavaBuzzwordListImg: UIImage(named: "카공족")!, coavaBuzzwordListTitle: "카공족", coavaBuzzwordListExplain: "'카페에서 공부하는 사람들'을 가리키는 유행어"),
    coavaBuzzwordList(coavaBuzzwordListImg: UIImage(named: "졌잘싸")!, coavaBuzzwordListTitle: "졌잘싸", coavaBuzzwordListExplain: "'졌지만 잘 싸웠다'의 줄임말. 거의 패배자가 승리자한테 칭찬하면서 위로할 때 사용한다"),
    coavaBuzzwordList(coavaBuzzwordListImg: UIImage(named: "머선129")!, coavaBuzzwordListTitle: "머선129", coavaBuzzwordListExplain: "‘무슨'을 '머선'으로, '일이고'를 '129'로 표현한 유행어. '무슨 일이야'를 사투리로 바꾼것이다"),
    coavaBuzzwordList(coavaBuzzwordListImg: UIImage(named: "갑분싸")!, coavaBuzzwordListTitle: "갑분싸", coavaBuzzwordListExplain: "'갑자기 분위기가 싸해지는 상황'을 유머러스하게 표현하고자 할 때 쓰는 줄임말")
]

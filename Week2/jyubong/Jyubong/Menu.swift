//
//  Menu.swift
//  Jyubong
//
//  Created by 김진주 on 2023/09/09.
//

var naughtyCat = Shop(name: "못된고양이")
var eMart = Shop(name: "이마트")
var shopList: [Shop] = [artBox, naughtyCat, eMart]

func printMenu() {
    print("이름을 입력하세요 : ")

    guard let camperName = readLine() else { return }

    print("""
    어서오세요. \(camperName)님
    메뉴를 선택해주세요.
    1. 쇼핑하기 2. 게임 종료
    """)
    
    guard let camperChoice = readLine(), let camperChoice = Int(camperChoice) else {
        print("올바르게 입력해주세요.")
        printMenu()
        return
    }
    
    switch camperChoice {
    case 1:
        chooseShop(shopList: shopList)
    case 2:
        return
    default:
        print("올바른 메뉴를 입력해주세요.")
        printMenu()
    }
}

func chooseShop(shopList: [Shop]) {
    print("어디로 갈까요?")
    for (index, shop) in shopList.enumerated() {
        let index = index+1
        print("\(index). \(shop)", terminator: "")
    }
    
    guard let camperChoice = readLine(), let camperChoice = Int(camperChoice) else {
        print("올바르게 입력해주세요.")
        printMenu()
        return
    }
}

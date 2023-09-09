//
//  main.swift
//  Jyubong
//
//  Created by 김진주 on 2023/09/08.
//

var artBox = Shop(name: "아트박스")
var jyubong = Camper(name: "쥬봉이", budget: 3000, visitedShop: artBox)
//var jyubong = Camper(name: "쥬봉이", visitedShop: artBox)

while true {
    do {
        
        let choice = try jyubong.chooseProduct()
        try jyubong.buy(productNumber: choice)

    } catch ProductError.outOfStock {
        print("해당 상품이 품절되었습니다.\n")
    } catch ProductError.outOfNumber {
        print("존재하지 않는 상품 번호입니다.\n")
    } catch ProductError.outOfMoney {
        print("예산이 부족해 상품을 구매할 수 없습니다.\n")
    }
}


//
//  main.swift
//  Jyubong
//
//  Created by 김진주 on 2023/09/08.
//

var jyubong = Camper()
var artBox = Shop()

do {
    artBox.displayProducts()
    
    try jyubong.buy(productNumber: 2)
//    try jyubong.buy(productNumber: 8)
//    artBox.displayProducts()
    
    try jyubong.buy(productNumber: 2)
//    try jyubong.buy(productNumber: 1)
//    try jyubong.buy(productNumber: 3)
    
} catch ProductError.outOfStock {
    print("해당 상품이 품절되었습니다.")
} catch ProductError.outOfNumber {
    print("존재하지 않는 상품 번호입니다.")
} catch ProductError.outOfMoney {
    print("예산이 부족해 상품을 구매할 수 없습니다.")
}

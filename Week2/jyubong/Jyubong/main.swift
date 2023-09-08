//
//  main.swift
//  Jyubong
//
//  Created by 김진주 on 2023/09/08.
//

var artBox = Shop(name: "아트박스")
var jyubong = Camper(name: "쥬봉이", visitedShop: artBox)

while jyubong.budget > 0 {
    let choice = try jyubong.chooseProduct()
    try jyubong.buy(productNumber: choice)
}
    


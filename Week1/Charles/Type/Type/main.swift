//
//  main.swift
//  Type
//
//  Created by Charles on 2023/09/08.
//

import Foundation

var yagomShop = Shop(productsList: ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"])
var charles = Camper(budget: 3000)

charles.buy(productNumber: 2, shop: yagomShop)
charles.buy(productNumber: 2, shop: yagomShop)


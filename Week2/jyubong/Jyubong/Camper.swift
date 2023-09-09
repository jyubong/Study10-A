//
//  Camper.swift
//  Jyubong
//
//  Created by jyubong on 2023/09/08.
//

struct Camper {
    var budget: Int = 2000
    var shop = Shop()
    
    mutating func buy(productNumber: Int) throws {
        // 예산확인
        guard self.budget >= 1000 else {
            throw ProductError.outOfMoney
        }
        
        let product = try shop.manageProduct(productNumber: productNumber)
        print("\(product)를 구매했습니다.")
        
        self.budget -= 1000
        print("남은 예산이 \(budget)입니다.")
    }
}

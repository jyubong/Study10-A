//
//  Camper.swift
//  Jyubong
//
//  Created by jyubong on 2023/09/08.
//

struct Camper {
    var name: String
    var budget: Int = 2000
    var visitedShop: Shop
    
    func chooseProduct() throws -> Int {
        visitedShop.displayProducts()
        print("구매할 상품을 골라볼까? : ", terminator: "")
        
        guard let choice = readLine(), let choice = Int(choice) else {
            throw ProductError.outOfNumber
        }
        
        return choice
    }
    
    mutating func buy(productNumber: Int) throws {
            // 예산확인
            guard self.budget >= 1000 else {
                throw ProductError.outOfMoney
            }
            
            let product = try visitedShop.manageProduct(productNumber: productNumber)
            print("\(product)를 구매했습니다.")
            self.budget -= 1000
            print("남은 예산이 \(budget)입니다.\n")
    }
}

//
//  Shop.swift
//  Jyubong
//
//  Created by jyubong on 2023/09/08.
//

struct Shop {
    private(set) var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    func displayProducts() {
        for (index, _) in productsList.enumerated() {
            guard let product = productsList[index] else { continue }
            print("\(index)번 상품은 \(product)입니다.")
        }
    }
    
    mutating func manageProduct(productNumber: Int) throws -> String {
        // 상품 번호 확인
        guard 0..<productsList.count ~= productNumber else {
            throw ProductError.outOfNumber
        }
        
        // 상품 재고 확인
        guard let product = productsList[productNumber] else {
            throw ProductError.outOfStock
        } 
        
        productsList[productNumber] = nil
        
        return product
    }
}

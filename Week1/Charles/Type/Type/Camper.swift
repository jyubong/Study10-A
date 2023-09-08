//
//  Camper.swift
//  Type
//
//  Created by 김형철 on 2023/09/08.
//

import Foundation

struct Camper {
    private var budget: Int
    
    init(budget: Int) {
        self.budget = budget
    }
    
    private mutating func handleError(productNumber: Int, shop: Shop) -> Result<String, PurchaseError> {
        guard let product = shop.manageProducts(productNumber: productNumber) else {
            return Result.failure(PurchaseError.noneExistProduct)
        }
        
        guard budget >= 1000 else {
            return Result.failure(PurchaseError.overbudget)
        }
        
        budget -= 1000
        
        return Result.success(product)
    }
    
    mutating func buy(productNumber: Int, shop: Shop) {
        let product = handleError(productNumber: productNumber, shop: shop)
        
        switch product {
        case .success(let data):
            print("\(data) 구매")
        case .failure(.noneExistProduct):
            print("상품 품절")
        case .failure(.overbudget):
            print("예산 부족")
        }
    }
}

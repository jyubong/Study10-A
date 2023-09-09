//
//  Shop.swift
//  Type
//
//  Created by Charles on 2023/09/08.
//

import Foundation

class Shop {
    private var productsList: [String?]
    
    init(productsList: [String?]) {
        self.productsList = productsList
    }
    
    func manageProducts(productNumber: Int) -> String? {
        guard productNumber >= 0 && productNumber < productsList.count else { return nil }
        
        guard let product = productsList[productNumber] else { return nil }
        
        productsList[productNumber] = nil
        
        return product
    }
}

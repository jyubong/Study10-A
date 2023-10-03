//
//  Coffee.swift
//  Cafe
//
//  Created by jyubong on 2023/10/02.
//

final class Coffee {
    var kind: CoffeeMenu
    var amount: Int = 0
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}

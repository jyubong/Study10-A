//
//  CoffeMenu.swift
//  Cafe
//
//  Created by jyubong on 2023/10/02.
//

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 3000
        case .latte:
            return 4000
        }
    }
}

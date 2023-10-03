//
//  CafeShop.swift
//  Cafe
//
//  Created by jyubong on 2023/10/02.
//

final class CoffeeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        return manager.brew(menu)
    }
}

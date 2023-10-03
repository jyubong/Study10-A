//
//  CafeManager.swift
//  Cafe
//
//  Created by jyubong on 2023/10/02.
//

final class CafeManager: Person {
    override init(name: String, money: Int) {
        super.init(name: name, money: money)
    }
    
    convenience init(name: String) {
        self.init(name: name, money: 0)
    }
    
    func brew(_ menu: CoffeeMenu) -> Coffee {
        let coffee = Coffee(kind: menu)
        coffee.amount += 1
        
        print("\(coffee.kind) 나왔습니다.")
        
        return coffee
    }
}

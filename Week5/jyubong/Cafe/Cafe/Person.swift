//
//  Person.swift
//  Cafe
//
//  Created by jyubong on 2023/10/02.
//

class Person {
    let name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if self.money >= menu.price {
            coffee = shop.order(menu)
            self.money -= menu.price
            
            print("남은 잔액은 \(self.money)입니다.")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}

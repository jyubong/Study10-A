//
//  main.swift
//  Cafe
//
//  Created by jyubong on 2023/10/02.
//

var isOrdering: Bool = true

func setPerson() {
    print("당신의 이름은 무엇인가요? : ", terminator: "")
    guard let name = readLine() else { return }
    
    let person = Person(name: name, money: 5000)
    let shop = CoffeeShop(manager: CafeManager(name: "매니저"))
    
    selectCoffee(from: person, at: shop)
}

func selectCoffee(from person: Person, at shop: CoffeeShop) {
    var isSelecting: Bool = true
    
    while isSelecting {
        print("\(person.name)님 무엇을 주문할까요?")
        print("1. 아메리카노 2. 라떼  3. 종료")
        
        guard let choice = readLine() else { return }
        
        isSelecting = buyCoffee(for: choice, from: person, at: shop)
    }
}

func buyCoffee(for choice: String, from person: Person, at shop: CoffeeShop) -> Bool {
    switch choice {
    case "1":
        person.buy(.americano, at: shop)
    case "2":
        person.buy(.latte, at: shop)
    case "3":
        print("주문을 종료합니다.")
        return false
    default:
        print("없는 메뉴입니다. 다시 입력해주세요.")
    }
    
    return true
}

setPerson()

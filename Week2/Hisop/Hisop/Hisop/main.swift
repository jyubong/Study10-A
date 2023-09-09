//
//  main.swift
//  Hisop
//
//  Created by Hisop on 2023/09/08.
//
/*

class Shop {
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    func sellProduct(orderNumber: Int, customer: Camper) {
        print("구매 완료")
        productsList[orderNumber] = nil
    }
    
    func validateOrder(orderNumber: Int, customer: Camper) -> Bool {
        guard 1...productsList.count ~= orderNumber else {
            print("입력한 번호의 상품은 존재하지 않습니다.")
            return false
        }
        
        guard productsList[orderNumber] != nil else {
            print("품절입니다.")
            return false
        }
        
        guard customer.budget >= 1000 else {
            print("예산이 모자랍니다.")
            return false
        }
        
        return true
    }
}

struct Camper {
    var budget: Int = 2000
    
    mutating func buy(shop: Shop, itemNumber: Int) {
        guard shop.validateOrder(orderNumber: itemNumber, customer: self) else {
            return
        }
        shop.sellProduct(orderNumber: itemNumber, customer: self)
        budget -= 1000
    }
    
}

let shop1 = Shop()
let shop2 = Shop()
var Hisop = Camper()

Hisop.buy(shop: shop1, itemNumber: 3)
*/

class Camper {
    let name: String
    let id: String
    let number: Int
    
//    //Designated Initializer
//    init(name: String, id: String, number: Int) {
//        self.name = name
//        self.id = id
//        self.number = number
//    }
//    //Convenience Initializer
//    convenience init(name: String, id: String) {
//        self.init(name: name, id: id, number: 9)
//    }
    
    init?(name: String, id: String, number: Int) {
        if id.count != 3 {
            return nil
        }
        self.name = name
        self.id = id
        self.number = number
    }
    

    
}

let Hisop = Camper(name: "Hisop", id: "123", number: 1)

//let ABC = Camper(name: "ABC", id: "456")


//상속을 받게될 경우 서브클래스가 가진 프로퍼티에 대해서는 새로 init을 지정해주어야함

//구조체는 Memberwise Initializer를 지원한다.

struct Human {
    let name: String
    let age: Int
    let ageLimit: Bool
    
    init(name: String = "unknown", age: Int = 10, agelimit:Bool = true) {
        self.name = name
        self.age = age
        self.ageLimit = agelimit
    }

    init(name: String = "unknown", age: Int = 10) {
        self.init(name: name, age: age, agelimit: (age < 15))
    }
}

extension Human {
    init(name: String) {
        self.name = name
        self.age = 123
        self.ageLimit = false
    }
}


let Hisop_ = Human(name: "Hisop", age: 999, agelimit: true)

//당연히 커스텀 이니셜라이저 생성 가능 커스텀 생성하면 memberwise는 동작안함
//둘 다 골라서 쓰고싶다면 extension으로 밖으로 빼서 만들것.


//delegation pattern https://velog.io/@zooneon/Delegate-%ED%8C%A8%ED%84%B4%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C
//https://velog.io/@nala/iOS-Delegate-%ED%8C%A8%ED%84%B4%EC%9D%84-%EC%9D%B4%ED%95%B4%ED%95%B4%EB%B3%B4%EC%9E%90

class Me {
    weak var delegate: Brother?

    func 올때메로나() {
        delegate?.buyIcecream()
    }
}

class Brother {
    let me = Me()

        init() {
        me.delegate = self
    }

    func buyIcecream() {
        print("메로나를 샀다")
    }
}



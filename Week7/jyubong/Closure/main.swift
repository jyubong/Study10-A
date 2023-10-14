//
//  main.swift
//  Closure
//
//  Created by jyubong on 10/13/23.
//

// MARK: - 캐릭터 생성
let jyubong = Character()
jyubong.tabShiftKey(skill: jyubong.attack)

// MARK: - 고차함수
let fruits = ["사과", "바나나", "딸기", "배", "망고"]

let fruitsJuiceList = fruits.map { $0 + "쥬스" }
let myFruitsJuiceList = fruits.myMap { $0 + "쥬스" }

let fruitsList = fruits.reduce("과일 종류 : ") { $0 + ($1 + ", " ) }
let myFruitsList = fruits.myReduce("과일 종류 : ") { $0 + ($1 + ", " ) }

let twoLettersFruits = fruits.filter { $0.count == 2 }
let myTwoLettersFruits = fruits.myFilter { $0.count == 2 }

print(fruitsJuiceList)
print("my : \(myFruitsJuiceList)")
print(fruitsList)
print("my : \(myFruitsList)")
print(twoLettersFruits)
print("my : \(myTwoLettersFruits)")


// MARK: - cloure
let names: [String] = ["jyubong", "charles", "hisop"]

var reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print("reversed 클로저 : \(reversed)")

// 후행 클로저
reversed = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}
print("reversed 후행클로저 : \(reversed)")

// () 생략
reversed = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}
print("reversed ()생략 : \(reversed)")

// 타입 생략
reversed = names.sorted { (first, second) in
    return first > second
}
print("reversed 타입 생략 : \(reversed)")

// 단축 인자
reversed = names.sorted {
    return $0 > $1
}
print("reversed 단축인자 : \(reversed)")

// 암시적 반환
reversed = names.sorted { $0 > $1 }
print("reversed 암시적 전환 : \(reversed)")

// 연산자 함수를 클로저의 함수로 사용
reversed = names.sorted(by: >)
print("reversed 연산자 : \(reversed)")

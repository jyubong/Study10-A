//
//  main.swift
//  Jyubong
//
//  Created by  Jyubong on 2023/09/01.
//

import Foundation

// Mark: - 실험1
// 굿즈리스트
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// if let
//for index in 0..<productsList.count {
//    if let product = productsList[index] {
//        print("\(index)번 상품은 \(product)입니다.")
//    }
//}
//
//// guard let
//for index in 0..<productsList.count {
//    guard let product = productsList[index] else { continue }
//    print("\(index)번 상품은 \(product)입니다.")
//}
//
//// switch
//for index in 0..<productsList.count {
//    let product = productsList[index]
//
//    switch product {
//    case let .some(product):
//        print("\(index)번 상품은 \(product)입니다.")
//    case .none:
//        break
//    }
//}

// compactMap
let mappedProductsList: [String] = productsList.compactMap { $0 }
for index in 0..<mappedProductsList.count {
    let product = mappedProductsList[index]
    
    print("\(index)번 상품은 \(product)입니다.")
}

// Mark: - 실험2
var budget: Int = 2000

func buy(productNumber: Int) {
    // 상품 번호 확인
    guard 0..<productsList.count ~= productNumber else {
        print("존재하지 않는 상품 번호입니다.")
        return
    }

    // 상품 재고 확인
    guard let product = productsList[productNumber] else {
        print("해당 상품이 품절되었습니다.")
        return
    }

    // 예산확인
    guard budget >= 1000 else {
        print("예산이 부족해 상품을 구매할 수 없습니다.")
        return
    }

    print("\(product)를 구매했습니다.")
    productsList[productNumber] = nil
    budget -= 1000
    print("남은 예산이 \(budget)입니다.")
}

//buy(productNumber: 1)
//buy(productNumber: 8)
//buy(productNumber: 2)
//buy(productNumber: 1)
//buy(productNumber: 3)

// Mark: - 실험3
// 에러 정의
enum ProductError: Error {
    case soldOut
    case overNumber
    case tightMoney
}

func buyProduct(productNumber: Int) throws {
    // 상품 번호 확인
    guard 0..<productsList.count ~= productNumber else {
        throw ProductError.overNumber
    }

    // 상품 재고 확인
    guard let product = productsList[productNumber] else {
        throw ProductError.soldOut
    }

    // 예산확인
    guard budget >= 1000 else {
        throw ProductError.tightMoney
    }

    print("\(product)를 구매했습니다.")
    productsList[productNumber] = nil
    budget -= 1000
    print("남은 예산이 \(budget)입니다.")
}

do {

    try buyProduct(productNumber: 1)
//    try buyProduct(productNumber: 8)
    try buyProduct(productNumber: 2)
    try buyProduct(productNumber: 1)
    try buyProduct(productNumber: 3)

} catch ProductError.soldOut {
    print("해당 상품이 품절되었습니다.")
} catch ProductError.overNumber {
    print("존재하지 않는 상품 번호입니다.")
} catch ProductError.tightMoney {
    print("예산이 부족해 상품을 구매할 수 없습니다.")
} catch {
    // default
    print("Unexpected error: \(error.localizedDescription)")
}

do {
    
    try buyProduct(productNumber: 1)
//    try buyProduct(productNumber: 8)
    try buyProduct(productNumber: 2)
    try buyProduct(productNumber: 1)
    try buyProduct(productNumber: 3)
    
} catch {
    // error 상수 제공
    // 에러 타입(프로토콜)이므로 내가 정의한 에러로 타입캐스팅
    if let error = error as? ProductError {
        switch error {
        case .soldOut:
            print("해당 상품이 품절되었습니다.")
        case .overNumber:
            print("존재하지 않는 상품 번호입니다.")
        case .tightMoney:
            print("예산이 부족해 상품을 구매할 수 없습니다.")
        }
    }
}

// try? 에러가 발생하면 nil 리턴
try? buyProduct(productNumber: 8)

// try! 에러가 없다는 확신이 있을 때
//try! buyProduct(productNumber: 1)

//var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
 
/*
for (index, value) in productsList.enumerated() {
    guard let unwrapValue = value else {
        continue
    }
    print("\(index)번 상품은 \(unwrapValue)입니다.")
}
*/
 
/*
for (index, value) in productsList.enumerated() {
    if let unwrapValue = value {
    print("\(index)번 상품은 \(unwrapValue)입니다.")
    }
}
*/

/*
var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func buy(productNumber: Int) {
    guard 1...productsList.count ~= productNumber else {
        print("입력한 번호의 상품은 존재하지 않습니다.")
        return
    }
    guard let _ = productsList[productNumber] else {
        print("품절입니다.")
        return
    }
    guard budget >= 1000 else {
        print("예산이 모자랍니다.")
        return
    }
    budget -= 1000
    print("구매 완료")
    productsList[productNumber] = nil
}
 
buy(productNumber: 1)
print(productsList)
print(budget)

buy(productNumber: 4)
print(productsList)
print(budget)
*/
 
 
//do-try-catch문 예시 https://github.com/Hi-sop/ios-number-baseball/blob/832a96e738c53a00db396d59819a514d73bf2599/NumberBaseball/NumberBaseball/main.swift

// try? -> 에러발생시 nil반환, 반환타입 optional
// try! -> 에러발생시 Crash, 반환타입 non-optional

/*
enum OrderError: Error {
    case outOfNumber
    case soldOut
    case insufficientCash
}

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func buy(productNumber: Int) throws -> String {
    guard 1...productsList.count ~= productNumber else {
        throw OrderError.outOfNumber
    }
    guard let _ = productsList[productNumber] else {
        throw OrderError.soldOut
    }
    guard budget >= 1000 else {
        throw OrderError.insufficientCash
    }
    budget -= 1000
    print("구매 완료")
    guard let product = productsList[productNumber] else {
        return ""
    }
    productsList[productNumber] = nil
    return product
}

do {
    try buy(productNumber: 3)
} catch OrderError.outOfNumber {
    print("입력한 번호의 상품은 존재하지 않습니다")
} catch OrderError.soldOut {
    print("품절")
} catch OrderError.insufficientCash {
    print("잔액부족")
}

let product = try? buy(productNumber: 3)
    print(product)

if let product = try? buy(productNumber: 4) {
    print(product)
}
*/

//let boom = try! buy(productNumber: 5)
//print(boom)

//result type -> @frozen enum Result<Success, Failure> where Failure : Error
//https://developer.apple.com/documentation/swift/result

 enum OrderError: Error {
     case outOfNumber
     case soldOut
     case insufficientCash
 }
 
 var budget: Int = 2000
 var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

 func buy(productNumber: Int) -> Result<Bool, OrderError> {
     guard 1...productsList.count ~= productNumber else {
         return .failure(.outOfNumber)
     }
     guard let _ = productsList[productNumber] else {
         return .failure(.soldOut)
     }
     guard budget >= 1000 else {
         return .failure(.insufficientCash)
     }
     budget -= 1000
     print("구매 완료")
     productsList[productNumber] = nil
     return .success(true)
 }

let test = buy(productNumber: 15)
switch test {
case .success(let data):
    print(data)
case .failure(let error):
    print(error)
}

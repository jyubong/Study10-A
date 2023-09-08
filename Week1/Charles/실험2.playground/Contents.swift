import Foundation

var budget: Int = 2000
var productsList: [String?] = ["봂펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
var purchasingProductNumber: Int = 1

enum PurchaseError: Error {
    case nonexistentOrOutofStockProduct
    case OverBudget
}



func buy(productNumber: Int) throws {
    guard productsList[productNumber] != nil else {
        throw PurchaseError.nonexistentOrOutofStockProduct
    }
    
    guard budget >= 1000 else {
        throw PurchaseError.OverBudget
    }
    
    productsList[productNumber] = nil
    budget -= 1000
    
    print("남은 돈은 \(budget)원 입니다.")
}

do {
    try buy(productNumber: purchasingProductNumber)
} catch PurchaseError.nonexistentOrOutofStockProduct {
    print("존재하지 않거나, 품절된 상품입니다.")
} catch PurchaseError.OverBudget {
    print("돈 부족.")
}

/*
purchasingProductNumber = 2

do {
    try buy(productNumber: purchasingProductNumber)
} catch PurchaseError.nonexistentOrOutofStockProduct {
    print("존재하지 않거나, 품절된 상품입니다.")
} catch PurchaseError.OverBudget {
    print("돈 부족.")
}

purchasingProductNumber = 3

do {
    try buy(productNumber: purchasingProductNumber)
} catch PurchaseError.nonexistentOrOutofStockProduct {
    print("존재하지 않거나, 품절된 상품입니다.")
} catch PurchaseError.OverBudget {
    print("돈 부족.")
}

purchasingProductNumber = 2

do {
    try buy(productNumber: purchasingProductNumber)
} catch PurchaseError.nonexistentOrOutofStockProduct {
    print("존재하지 않거나, 품절된 상품입니다.")
} catch PurchaseError.OverBudget {
    print("돈 부족.")
}
*/




/*
// 공식문서 정의.
// MARK: - 각 케이스에 연관값을 포함하는 성공 또는 실패 중 하나를 나타내는 값
enum Result<Success, Failure> where Failure: Error {
    case success(Sucess) -> 성공했을 때: 어떠한 타입
    case failure(Failure) -> 실패했을 때: 정의한 에러
}
*/



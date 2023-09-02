import Foundation

var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func unwrapProducts() {
    // MARK: - if let 바인딩
        for index in 0 ..< productsList.count {
            if let product = productsList[index] {
                print("\(index)번 상품은 \(product)입니다.")
            }
        }

    //  MARK: - guard let 바인딩
    for (index, product) in productsList.enumerated() {
        guard let product = product else { continue }

        print("\(index)번 상품은 \(product)입니다.")
    }

    // MARK: - Unconditional Unwrapping
        for (index, product) in productsList.enumerated() {
            print("\(index)번 상품은 \(product!)입니다.")
        }
    
        // MARK: - Nil-Coalescing Operator
        for (index, product) in productsList.enumerated() {
            print("\(index)번 상품은 \(product ?? "상품이 없습니다")")
        }
}

unwrapProducts()

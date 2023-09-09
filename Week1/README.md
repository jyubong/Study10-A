## Optional

### 🔎실험1
#### optional Binding
``` swift
// 굿즈리스트
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
```
<details>
<summary>if let</summary>

``` swift
for (index, value) in productsList.enumerated() {
    if let unwrapValue = value {
    print("\(index)번 상품은 \(unwrapValue)입니다.")
    }
}
```
</details>
<details>
<summary>guard let</summary>

``` swift
for (index, value) in productsList.enumerated() {
    guard let unwrapValue = value else {
        continue
    }
    print("\(index)번 상품은 \(unwrapValue)입니다.")
}
```
</details>

#### Nil-Coalescing
```swift
for (index, product) in productsList.enumerated() {
  print("\(index)번 상품은 \(product ?? "상품이 없습니다")")
}
```


#### Unconditional Unwrapping
```swift
for (index, product) in productsList.enumerated() {
   print("\(index)번 상품은 \(product!)입니다.")
}
```


#### Switch
```swift
for index in 0..<productsList.count {
    let product = productsList[index]

    switch product {
    case let .some(product):
        print("\(index)번 상품은 \(product)입니다.")
    case .none:
        break
    }
}
```


#### CompactMap
```swift
let mappedProductsList: [String] = productsList.compactMap { $0 }
for index in 0..<mappedProductsList.count {
    let product = mappedProductsList[index]
    
    print("\(index)번 상품은 \(product)입니다.")
}
```


### 🔎실험2
<details>
<summary>코드</summary>

``` swift
var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func buy(productNumber: Int) {
    guard 1...productsList.count ~= productNumber else {
        print("존재하지 않는 상품 번호입니다.")
        return
    }
    guard let product = productsList[productNumber] else {
        print("해당 상품이 품절되었습니다.")
        return
    }
    guard budget >= 1000 else {
        print("예산이 부족해 상품을 구매할 수 없습니다.")
        return
    }

    print("\(product)를 구매했습니다.")
    productsList[productNumber] = nil
    budget -= 1000
    print("남은 예산이 \(budget)입니다.")
}
```
</details>

### 🔎Error Handling
<details>
<summary>Error Handling</summary>

``` swift
var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

 enum OrderError: Error {
     case outOfNumber
     case soldOut
     case insufficientCash
 }

func buyProduct(productNumber: Int) throws {
    // 상품 번호 확인
    guard 0..<productsList.count ~= productNumber else {
        throw OrderErrorr.outOfNumber
    }

    // 상품 재고 확인
    guard let product = productsList[productNumber] else {
        throw OrderError.soldOut
    }

    // 예산확인
    guard budget >= 1000 else {
        throw OrderError.insufficientCash
    }

    print("\(product)를 구매했습니다.")
    productsList[productNumber] = nil
    budget -= 1000
    print("남은 예산이 \(budget)입니다.")
}

do {

    try buyProduct(productNumber: 1)

} catch OrderError.soldOut {
    print("해당 상품이 품절되었습니다.")
} catch OrderError.outOfNumber {
    print("존재하지 않는 상품 번호입니다.")
} catch OrderError.insufficientCash {
    print("예산이 부족해 상품을 구매할 수 없습니다.")
} catch {
    // default
    print("Unexpected error: \(error.localizedDescription)")
}

do {
    
    try buyProduct(productNumber: 1)
    
} catch {
    // error 상수 제공
    // 에러 타입(프로토콜)이므로 내가 정의한 에러로 타입캐스팅
    if let error = error as? OrderError {
        switch error {
        case .soldOut:
            print("해당 상품이 품절되었습니다.")
        case .outOfNumberr:
            print("존재하지 않는 상품 번호입니다.")
        case .insufficientCash:
            print("예산이 부족해 상품을 구매할 수 없습니다.")
        }
    }
}

```
</details>


### 🔎Result type
<details>
<summary>Result type</summary>

``` swift
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

// 성공, 실패 분기처리
switch test {
case .success(_):
    break
case .failure(let error):
    print(error)
}
```
</details>

---
### 참고문서
[Swift 공식문서 Optional](https://developer.apple.com/documentation/swift/optional)   
[Swift 공식문서 Error Handling](https://developer.apple.com/documentation/swift/optional](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)   
[Swift 공식문서 Result](https://developer.apple.com/documentation/swift/result)

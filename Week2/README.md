## Type


### 🔎 인스턴스의 객체지향적인 소통

#### Shop코드
```swift
struct Shop {
    var name: String
    private(set) var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    func displayProducts() {
        print("\(name)에 오신 것을 환영합니다.")
        for (index, _) in productsList.enumerated() {
            guard let product = productsList[index] else {
                print("\(index)번 상품은 품절입니다.")
                continue
            }
            print("\(index)번 상품은 \(product)입니다.")
        }
    }
    
    mutating func manageProduct(productNumber: Int) throws -> String {
        // 상품 번호 확인
        guard 0..<productsList.count ~= productNumber else {
            throw ProductError.outOfNumber
        }
        
        // 상품 재고 확인
        guard let product = productsList[productNumber] else {
            throw ProductError.outOfStock
        } 
        
        productsList[productNumber] = nil
        
        return product
    }
}
```

#### camper코드

```swift
struct Camper {
    var name: String
    var budget: Int = 2000
    var visitedShop: Shop
    
    func chooseProduct() throws -> Int {
        visitedShop.displayProducts()
        print("구매할 상품을 골라볼까? : ", terminator: "")
        
        guard let choice = readLine(), let choice = Int(choice) else {
            throw ProductError.outOfNumber
        }
        
        return choice
    }
    
    mutating func buy(productNumber: Int) throws {
            // 예산확인
            guard self.budget >= 1000 else {
                throw ProductError.outOfMoney
            }
            
            do {
                let product = try visitedShop.manageProduct(productNumber: productNumber)
            } catch ProductError.outOfNumber {
                throw ProductError.outOfNumber
            } catch ProductError.outOfStock {
                throw ProductError.outOfStock
            }
        
            print("\(product)를 구매했습니다.")
            self.budget -= 1000
            print("남은 예산이 \(budget)입니다.\n")
    }
}
```


#### main코드

```swift
var artBox = Shop(name: "아트박스")
var jyubong = Camper(name: "쥬봉이", budget: 3000, visitedShop: artBox)

let result = Result {
    try buy(productNumber: 2) {
    case .success():
        print("구매 완료")
    case .failure(.outOfNumber):
        print("상품 품절")
    case .failure(.outOfMoney):
        print("예산 부족")
    case .failure(.outOfStock)
        print("해당 상품번호 존재하지 않음")
}
```

### 🔎 Initialization

#### 실패 가능 생성자
```swift=
init?(name: String, id: String, number: Int) {
    if id.count != 3 {
        return nil
    }
    self.name = name
    self.id = id
    self.number = number
}
```
조건에 맞지 않을 경우 init이 nil을 반환하도록 설계할 수 있다.

#### Delegation
```swift=
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
```
init은 다른 init을 호출할 수 있다.  

#### 커스텀 이니셜라이저와 memberwise 이니셜라이저 같이 사용
```swift=
extension Human {
    init(name: String) {
        self.name = name
        self.age = 123
        self.ageLimit = false
    }
}
```
extension을 통한 추가적인 선언이 필요하다.


## HIG
  
### 🔎 연락처 앱 분석

#### modal & navigation 선택 기준
- 계층적인 화면 이동에는 네비게이션
- 추가하는 동작 등 명확한 구분이 있는 액션엔 모달을 선택

#### modal
연락처 목록에 새 연락처를 추가하는 작업은 +버튼을 통한 modal호출로 구현되었다.

#### modal 사용시 지켜야 할 점

- 명확한 이점이 있는 경우에만 콘텐츠를 모달 방식으로 표시
- 모달 작업은 단순하고 짧으며 집중적으로 유지하는 것을 목표로 한다.
- 앱 내에서 앱처럼 느껴지는 모달 경험을 만들지 않도록 한다.
- 심층적인 콘텐츠나 복잡한 작업에는 전체 화면 모달 스타일을 사용하는 것이 좋다.
- 항상 사람들에게 모달 뷰를 무시할 수 있는 명확한 방법을 제공한다.
- 필요한 경우 모달 보기를 닫기 전에 확인을 받아 데이터 손실을 방지할 수 있다.
- 모달 뷰가 어떤 작업을 하는지 쉽게 식별할 수 있도록 한다.
- 모달 뷰가 모달 뷰를 불러오지 않도록 한다.

#### TableView
연락처 목록은 테이블뷰로 구현된 것으로 보인다.

#### TableView & collectionView
- TableView는 단일 열에 배열된 행을 사용해 데이터를 표시한다.

- collectionView는 커스텀 가능한 레이아웃을 통해 데이터를 표시한다.

TableView 수직으로만 스크롤이 가능하고, collectionView는 수직/수평 스크롤 구현이 가능하다.


#### 네비게이션 버튼
연락처 앱의 상단부는 네비게이션을 통해 현재 계층을 표시하고 버튼을 통해 부가적인 동작을 수행할 수 있도록 했다.

#### disclosure-controls
연락처 목록을 토글형태로 열고 닫는 구현은 이 기능을 사용한것으로 보인다(정확하지 않음)

#### 화면전환을 구성하는 방식 구분하기
화면전환의 방식에는 세그/네비게이션 방식이 있다는 것만 알아두고 넘어가면 될 듯
나중에 배우게 될 것이라는 코멘트를 받았다.
당장은 modal & navigation 선택 기준이 더 중요하다.

---
### 🔎 참고문서
[modal 타입과 네비게이션 타입 선택 기준 - 모범사례 참고하기](https://developer.apple.com/design/human-interface-guidelines/modality)
[list-and-tables](https://developer.apple.com/design/human-interface-guidelines/lists-and-tables)
[disclosure-controls](https://developer.apple.com/design/human-interface-guidelines/disclosure-controls)


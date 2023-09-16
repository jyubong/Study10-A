## MVC 서로의 관계

![Untitled](https://github.com/jyubong/Study10-A/assets/126065608/8166689a-f14d-421e-a2eb-35734efb31bb)


✔️Controller → Model : Controller가 원하는대로 Model과 소통 가능

- 무엇이 어떤건지에 대해 사용자에게 보여줘야 하기 때문에 모델에 대한 접근이 가능해야 한다.
- 모델의 공개된 모든 기능과는 거의 무제한적인 대화가 가능하다.

✔️Model → Controller : 직접적인 소통은 불가능

- Model은 데이터의 값을 바꾸고 관리하는것만
- `Notification & KVO`로 전달

✔️Model과 View는 소통 불가능

- Model은 UI와 독립적, View는 UI에 의존
- View는 일반 객체일 뿐(버튼 그 자체가 무슨 일을 하는지는 알 수가 없다.)

✔️Controller → View : Controller는 `outlet`을 통해 View 객체들을 모두 관리 가능

✔️View → Controller : 구조적으로 미리 정해진 방식을 통해 Controller에게 행위에 대한 요청(delegate)과 데이터에 대한 요청(data source) 가능

- Delegate는 말그대로 위임한다는 뜻으로 유저가 화면에 값을 입력 할 때 혹은 터치나 드래그를 하여 event를 발생 시켰을 때, 프로그램에서 해야 할 일들을 Controller에게 위임
- `target-action`의 구조를 통해 사용자의 행위에 따라 필요한 함수를 호출
    - target: Controller가 해야하는 건 자신에게 타겟을 만드는 것
    - action: UIButton이나 다른 것들은 액션을 가지고 버튼을 누를때마다 타겟을 호출

## 스토리보드는 MVC 관점에서 View 인가

스토리보드는 xml로 이루어짐

- <viewController>안에 <View>
- TextField, label, button 등이 표시
- button은 <connections><action>으로 view controller와 연결되어있을뿐
- label과 TextField도  <connections><outlet>으로 프로퍼티와 연결만 되어있음

따라서 한낱 View에 지나지 않나…

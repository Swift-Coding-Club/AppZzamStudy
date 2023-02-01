# 10. 스위프트의 객체 지향 프로그래밍 기초

## 10.13 불투명 반환 타입

- **불투명 반환 타입(opaque return type)**
  - ↔️ **구체화된 특정 타입(concrete return type)**

```swift
//: 구체화된 특정 타입
func doubleFunc(value: Int) -> Int {
    value * 2
}

//: **불투명 반환 타입**
// some + ProtocolName
func doubleFunc1(value: Int) -> some Equatable {
    value * 2
}

func doubleFunc2(value: String) -> some Equatable {
    value + value
}
```
- 반환 타입이 아니라 반환타입의 **자격**에 대해 아는 것
- 공개 API 내에서 사용되는 반환 타입을 숨기기 위해 의도적으로 이렇게 설계된다.
  - 프로그래머는 특정 구체화된 타입을 반환하는 함수에 의존하지 않게 된다.
  - 접근되지 않는 내부 객체에 접근하게 되는 위험이 없어진다.
  - 다른 프로토콜과 호환되는 타입을 반환하도록 하는 변경을 포함해 내부 구현체를 변경할 떄, API를 사용하는 모든 코드의 의존성이 깨질 염려를 하지 않아도 된다.
    - 무슨 의미???
- 올바르지 않은 inference 문제는 발생하지 않을까?
  ```swift
  let intOne = doubleFunc1(value: 10)
  let stringOne = doubleFunc2(value: "Hello")

  if (intOne == stringOne) {
    print("They match")
  }
  // Binary operator '==' cannot applied to operands of type 'some Equatable' and 'some Equatable'
  // Conflicting arguments to generic parameter 'Self' ('some Equatable' (result type of 'doubleFunc1') vs. 'some Equatable' (result type of 'doubleFunc2'))
  ```
  - Swift Compiler 유효하지 않은 코드를 실행하려고 하는 지점에서 다음과 같은 구문 오류가 발생한다.
- SwiftUI의 building block은 일반적으로 View 프로토콜을 따른다.
  - View 프로토콜을 따르는 불투명 타입을 반환하도록 선언함으로써 (`some View`)
  - 유연하며 상호호환성 있는 빌딩 블록이 되며,
  - 더 깔끔하고 재사용과 유지보수하기 쉬운 코드가 됨


## 10.14 요약
- 객체 지향 프로그래밍 언어
  - 코드의 재사용
  - 클래스 인스턴스 내의 데이터 캡슐화
- 이번 장에서 다룬 것
  - 클래스
  - 인스턴스
  - 프로퍼티
    - 저장
    - 연산
  - 메서드
    - 인스턴스
    - 타입
  - 프로토콜
  - 불투명 반환 타입의 기본 구성
  
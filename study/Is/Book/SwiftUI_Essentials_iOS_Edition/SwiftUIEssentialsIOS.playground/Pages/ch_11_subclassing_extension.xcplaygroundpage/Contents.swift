//: [Previous](@previous)
//: # 11. 스위프트의 서브 클래싱과 익스텐션 개요

import Foundation

//: # 11.2 스위프트 상속 예제
class BankAccount {
    var accountBalance: Float
    var accountNumber: Int

    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }

    func displayBalance() {
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
}
/*:
 SavingsAccount에는 아무것도 구현하지 않았지만, 부모 클래스의 메서드를 사용할 수 있음.
 ```swift
 class SavingsAccount: BankAccount {

 }

 let a = SavingsAccount(number: 10, balance: 1000)
 a.displayBalance()
 ```

 */

//: ## 11.3 하위 클래스의 기능 확장하기
//: ## 11.4 상속받은 메서드 오버라이딩하기
//: ## 11.5 하위 클래스 초기화하기
class SavingsAccount: BankAccount {
    var interestRate: Float = 0.0
    init(number: Int, balance: Float, rate: Float) {
        interestRate = rate
        super.init(number: number, balance: balance)
    }

    func calculateInterest() -> Float {
        interestRate * accountBalance
    }

    override func displayBalance() {
        super.displayBalance()
        print("Prevailing interest rate is \(interestRate)")
    }
}

//: ## 11.6 SavingsAccount 클래스 사용하기
let savings1 = SavingsAccount(number: 12311, balance: 600, rate: 0.07)
print(savings1.calculateInterest())
savings1.displayBalance()

//: ## 11.7 스위프트 클래스 익스텐션

extension Double {
    var squared: Double {
        self * self
    }
    var cubed: Double {
        self * self * self
    }
}

let myValue = 3.0
print(myValue.squared)
print(myValue.cubed)
print(5.0.cubed)

//: [Next](@next)

//: [Previous](@previous)
//: # 13. 스위프트 프로퍼티 래퍼
import Foundation

struct Address {
    var city: String
}

struct AddressComputedProperty {
    private var cityname: String = ""

    var city: String {
        get { cityname }
        set { cityname = newValue.uppercased() }
    }
}

var address = AddressComputedProperty()
address.city = "London"
print(address.city) // LONDON

@propertyWrapper
struct FixCase {
    private(set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
}

var contact = Contact(name: "Kim park", city: "Seoul", country: "South Korea")
print("\(contact.name), \(contact.city), \(contact.country)")

//: ## 13.3 여러 변수와 타입 지원하기

@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    var min: V
    var max: V

    init(wrappedValue: V, min: V, max: V) {
        value = wrappedValue
        self.min = min
        self.max = max
    }

    var wrappedValue: V {
        get { value }
        set {
            switch newValue {
            case max...:
                value = max
            case ...min:
                value = min
            default:
                value = newValue
            }
        }
    }
}

struct Demo {
    @MinMaxVal(min: 100, max: 200) var value: Int = 88
}

var demo = Demo()
print(demo.value) // 88

demo.value = 160
print(demo.value) // 160

demo.value = 300
//print(demo.value) // 300


//: ### Comparable - String
_ = {
    struct Demo {
        @MinMaxVal(min: "Apple", max: "Orange") var value: String = ""
    }

    var demo = Demo()
    demo.value = "Banana"
    print(demo.value)

    demo.value = "Pear"
    print(demo.value)
}()

//: ### Comparable - Date
_ = {
    struct Demo {
        @MinMaxVal(min: Date(), max: Calendar.current.date(byAdding: .month, value: 1, to: Date())!) var value: Date = Date()
    }

    var demo = Demo()
    print(demo.value) // 2023-02-01 14:21:20 +0000

    // 10일 후
    demo.value = Calendar.current.date(byAdding: .day, value: 10, to: Date())! // 2023-02-11 14:21:20 +0000
    print(demo.value)

    // 2달 후
    demo.value = Calendar.current.date(byAdding: .month, value: 2, to: Date())!
    print(demo.value) // 2023-03-01 14:21:20 +0000
}()

//: [Next](@next)

import UIKit

struct Person {
    var firstName: String
    var lastName: String
    var isCool: Bool = false
    var age: Int {
        willSet {
            print(newValue)
            if newValue > 25 {
                print("You are about to become not cool.")
            } else {
                print("You are about to become cool.")
            }
        }
        didSet {
            print(oldValue)
            if age > 25 {
                isCool = false
            } else {
                isCool = true
            }
        }
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
}

let bob = Person(firstName: "Bob", lastName: "The-Builder", isCool: true, age: 30)


print("Hi \(bob.fullName) can he fix it?")
print("\(bob.fullName) yes he can!")

let me = Person(firstName: "Adison", lastName: "Green", isCool: true, age: 17)
me.fullName

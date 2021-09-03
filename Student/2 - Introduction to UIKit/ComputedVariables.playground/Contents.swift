import UIKit

struct Something {
    var firstNumber: Int
    
    init(firstNumber: Int) {
        self.firstNumber = firstNumber
    }
}

var number1 = Something(firstNumber: 10)
var number2 = number1
print(number1.firstNumber)
print(number2.firstNumber)
number1.firstNumber += 1
print(number1.firstNumber)
print(number2.firstNumber)

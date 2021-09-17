/*:
## Exercise - Failable Initializers

 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2020.
 */
struct Computer {
    let ram: Int
    let yearManufactured: Int
    
    init?(ram: Int, yearManufactured: Int) {
        if ram > 0 && yearManufactured > 1970 && yearManufactured < 2020 {
            self.ram = ram
            self.yearManufactured = yearManufactured
        } else {
            return nil
        }
    }
}

//:  Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
let myComputer = Computer(ram: 2, yearManufactured: 2019)
let myComputer2 = Computer(ram: 4, yearManufactured: 2022)
if let computer = myComputer {
    print(computer)
} else {
    print("There is nothing here.")
}
if let computer2 = myComputer2 {
    print(computer2)
} else {
    print("There is nothing here.")
}
/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
 */

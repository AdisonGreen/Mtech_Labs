/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var collection: [Any] = [4, "Hi", true, 7, 6.7, false, 4.6, "What is this"]
print(collection)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for myLoop in collection {
    if let integer = myLoop as? Int {
        print("The integer has a vaule of \(integer)")
    } else if let double = myLoop as? Double {
        print("The doudle has a vaule of \(double)")
    } else if let string = myLoop as? String {
        print("The String is \(string)")
    } else if let booleans = myLoop as? Bool {
        print("The boolean is \(booleans)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let thisDictionary: [String: Any] = ["Number 1": 2.4, "Number 2": 4, "Number3": "This is a string", "Number4": true]
print(thisDictionary.values)
print(thisDictionary.keys)
print(thisDictionary)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for dictionaryLoop in thisDictionary {
    if let integer = dictionaryLoop.value as? Int {
        total += Double(integer)
    } else if let double = dictionaryLoop.value as? Double {
        total += double
    } else if let _ = dictionaryLoop.value as? String {
        total += 1
    } else if let boolean = dictionaryLoop.value as? Bool {
        if boolean {
            total += 2
        } else {
            total -= 3
        }
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for loopingCollection in thisDictionary {
    if let integer = loopingCollection.value as? Int {
        total2 += Double(integer)
    } else if let double = loopingCollection.value as? Double {
        total2 += double
    } else if let string = loopingCollection.value as? String {
        if let string = Double(string) {
            total2 += string
        }
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */

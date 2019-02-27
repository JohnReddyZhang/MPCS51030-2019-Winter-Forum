import Foundation

class Dog {
    
    let name: String
    let age: Int
    
    // non-failable initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let dog = Dog(name: "", age: -2) // non-optional

dog.name
dog.age

class Cat {
    
    let name: String
    let age: Int
    
    // failable initializer
    init?(name: String, age: Int) {
        guard !name.isEmpty, age > 0 else { return nil }
        self.name = name
        self.age = age
    }
}

let cat = Cat(name: "", age: -2) // optional

cat?.name
cat?.age

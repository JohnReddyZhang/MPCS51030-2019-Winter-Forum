import UIKit

class Person {
    
    let firstName: String
    let lastName: String
    let fullName: String
    
    // designated initializer
    init(firstName: String, lastName: String, fullName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = fullName
    }
    
    // convenience initializer
    convenience init(firstName: String, lastName: String) {
        let fullName = "\(firstName) \(lastName)"
        self.init(firstName: firstName, lastName: lastName, fullName: fullName)
    }
}

let joe = Person(firstName: "Joe", lastName: "Smith", fullName: "Joe P. Smith")
joe.fullName

let kate = Person(firstName: "Kate", lastName: "Johnson")
kate.fullName

import Foundation

class City {
    init() {
        print("initializing...")
    }
    deinit {
        print("deinitializing...")
    }
}

var chicago: City? = City() // prints "initializing..."
var windyCity = chicago

chicago = nil
windyCity = nil // prints "deinitializing..."


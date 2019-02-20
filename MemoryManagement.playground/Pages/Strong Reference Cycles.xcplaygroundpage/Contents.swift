import Foundation

// Strong Reference Cycles

class Chef {
    let name: String
    var restaurant: Restaurant?
    
    init(name: String) {
        self.name = name
        print("initializing \(name)")
    }
    
    deinit {
        print("deinitializing \(name)")
    }
}

class Restaurant {
    let name: String
    var chef: Chef?
    
    init(name: String) {
        self.name = name
        print("initializing \(name)")
    }
    
    deinit {
        print("deinitializing \(name)")
    }
}

var stephanieIzard: Chef? = Chef(name: "Stephanie Izard")
var girlAndTheGoat: Restaurant? = Restaurant(name: "Girl & the Goat")

stephanieIzard?.restaurant = girlAndTheGoat
girlAndTheGoat?.chef = stephanieIzard

stephanieIzard = nil
girlAndTheGoat = nil

// Note that the deinitializers are never called.
// Both instances have strong references to each other,
// so neither one can be released from memory.

import Foundation

// Fixing Strong Reference Cycles

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
    weak var chef: Chef? // <-- change this variable to weak
    
    init(name: String) {
        self.name = name
        print("initializing \(name)")
    }
    
    deinit {
        print("deinitializing \(name)")
    }
}

var chef: Chef? = Chef(name: "Stephanie Izard")
var restaurant: Restaurant? = Restaurant(name: "Girl & the Goat")

chef?.restaurant = restaurant
restaurant?.chef = chef

chef = nil
restaurant = nil

// Making restaurant's reference to chef weak breaks our
// strong reference cycle. Now chef and restaurant are
// deinitialized when they are set to nil.

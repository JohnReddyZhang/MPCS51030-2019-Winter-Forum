import Foundation

enum State: String {
    case illinois = "IL"
    case indiana = "IN"
    case michigan = "MI"
    case minnesota = "MN"
    case ohio = "OH"
    case wisconsin = "WI"
}

// A failable initializer that takes a raw value is generated for you

let landOfLincoln = State(rawValue: "IL")
let sunshineState = State(rawValue: "FL")




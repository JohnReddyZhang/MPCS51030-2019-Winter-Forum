import Foundation

// Reference Types

class City {
    var isBelowFreezing = false
}

let chicago = City()
let windyCity = chicago

chicago.isBelowFreezing = true

chicago.isBelowFreezing // true
windyCity.isBelowFreezing // true


// Value Types

struct Forecast {
    var degreesFarenheit: Int = 32
}

var forecastToday = Forecast()
var forecastTomorrow = forecastToday

forecastToday.degreesFarenheit += 5

forecastToday.degreesFarenheit // 37
forecastTomorrow.degreesFarenheit // 32

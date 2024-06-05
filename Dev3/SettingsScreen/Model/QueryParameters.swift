import Foundation

struct QueryParameters {
    let numberOfCharacters : Int
}

enum Status : String {
    case alive = "alive"
    case dead = "dead"
}

enum Gender : String {
    case male = "male"
    case female = "female"
}

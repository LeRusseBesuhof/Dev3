import Foundation

final class NetworkDataFuncs {
    // static func generateFiveRandomNumbers() -> [Int] { }
    
    static func getCorrectName(defaultName: String) -> String {
        var curName = defaultName
        let indexOfSpace : String.Index? = curName.firstIndex(of: " ")
        if let indexOfSpace = indexOfSpace {
            curName.removeSubrange(indexOfSpace..<curName.endIndex)
        }
        return curName
    }
}

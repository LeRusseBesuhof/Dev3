import Foundation

final class NetworkDataFuncs {
    static func generateRandomNumbers(count: Int) -> String {
        var checkSet : Set = Set<Int>()
        var resultString = ""
        var ind = 0
        while ind < count {
            let randomNumber = Int.random(in: 1...666)
            if !checkSet.contains(randomNumber) {
                checkSet.insert(randomNumber)
                resultString += "\(String(randomNumber)),"
                ind += 1
            }
        }
        return resultString
    }
}

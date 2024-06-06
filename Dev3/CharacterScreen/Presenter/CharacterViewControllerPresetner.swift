import Foundation
import UIKit

final class CharacterViewControllerPresetner {
    
    internal lazy var viewController : CharacterViewController = CharacterViewController()
    
    internal lazy var networkService : NetworkService = NetworkService()
    
    func setUpParameters(name: String, status: Status, gender: Gender) {
        networkService.parameters["name"] = name
        networkService.parameters["status"] = status.rawValue
        networkService.parameters["gender"] = gender.rawValue
    }
    
}

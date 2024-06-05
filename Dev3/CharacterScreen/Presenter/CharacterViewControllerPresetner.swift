import Foundation
import UIKit

final class CharacterViewControllerPresetner : CharacterVCPresenterProtocol {
    
    var viewController : CharacterVCProtocol = CharacterViewController()
    
    func setUpQueryItems(name: String, status: Status, gender: Gender) {
        viewController.queryItems.name = name
        viewController.queryItems.status = status.rawValue
        viewController.queryItems.gender = gender.rawValue
    }
}

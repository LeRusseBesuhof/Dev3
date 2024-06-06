import Foundation
import UIKit

protocol ViewControllerProtocol {
    var networkManager : NetworkProtocol! { get }
}

protocol SettingsVCProtocol : ViewControllerProtocol {
    var presenter : SettingsVCPresenterProtocol { get }
    func setUpQueryItems()
}

protocol CharacterVCProtocol {
    var queryItems : QueryItem { get set }
}

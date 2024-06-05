import Foundation
import UIKit

protocol ViewControllerProtocol {
    var networkManager : NetworkProtocol! { get }
}

protocol SettingsVCProtocol : ViewControllerProtocol {
    var presenter : SettingsVCPresenterProtocol { get }
    func setUpQueryItems()
}

protocol CharacterVCProtocol : ViewControllerProtocol {
    var queryItems : QueryItem { get set }
}

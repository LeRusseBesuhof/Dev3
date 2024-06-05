import Foundation

protocol SettingsVCPresenterProtocol {
    var viewController : SettingsVCProtocol { get }
    var characterPresenter : CharacterVCPresenterProtocol { get }
}

protocol CharacterVCPresenterProtocol {
    var viewController : CharacterVCProtocol { get }
    func setUpQueryItems(name: String, status: Status, gender: Gender)
}

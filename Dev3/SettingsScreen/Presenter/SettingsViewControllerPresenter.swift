import Foundation
import UIKit

final class SettingsViewControllerPresenter : SettingsVCPresenterProtocol {
    
    internal lazy var viewController : SettingsVCProtocol = SettingsViewController()
    
    internal lazy var characterPresenter : CharacterVCPresenterProtocol = CharacterViewControllerPresetner()

}

import Foundation
import UIKit

extension UIFont {
    static func getShadowFont(fontSize: CGFloat) -> UIFont {
        UIFont.init(name: ShadowIntoLightType.regular.rawValue, size: fontSize) ?? systemFont(ofSize: fontSize)
    }
    
    static func getCreepsterFont(fontSize: CGFloat) -> UIFont {
        UIFont.init(name: CreepsterType.regular.rawValue, size: fontSize) ?? systemFont(ofSize: fontSize)
    }
}

enum ShadowIntoLightType : String {
    case regular = "ShadowsIntoLight"
}

enum CreepsterType : String {
    case regular = "Creepster"
}

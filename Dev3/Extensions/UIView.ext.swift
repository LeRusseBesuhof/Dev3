import Foundation
import UIKit

extension UIView {
    static func config<T: UIView>(view: T, completion: @escaping (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        completion(view) // в этот момент происходит инициализация параметров вью
        return view // возвращается готовая вьюха
    }
}

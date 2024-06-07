import Foundation
import UIKit

final class AppUIFuncs {
    
    static func createLabel(with title: String? = nil, size: CGRect? = nil, alignment: NSTextAlignment, font: UIFont) -> UILabel {
        {
            $0.textAlignment = alignment
            $0.textColor = .white
            $0.backgroundColor = .brown
            $0.font = font
            $0.numberOfLines = .zero
            guard let title = title else { return $0 }
            $0.text = title
            guard let size = size else { return $0 }
            $0.frame = size
            return $0
        }(UILabel())
    }
    
    static func createTitleImageView(with size: CGRect, image: UIImage) -> UIImageView {
        {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.image = image
            $0.layer.cornerRadius = 20
            $0.backgroundColor = .black
            return $0
        }(UIImageView(frame: size))
    }
}

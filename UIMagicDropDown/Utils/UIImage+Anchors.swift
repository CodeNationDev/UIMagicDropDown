//CodeNationDev
import UIKit

public extension UIView {

    func anchor(left: NSLayoutXAxisAnchor? = nil, top: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, width: CGFloat? = nil, height: CGFloat? = nil, padding: UIEdgeInsets? = nil) {

        translatesAutoresizingMaskIntoConstraints = false

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: padding?.left ?? 0).isActive = true
        }

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding?.top ?? 0).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: padding?.right ?? 0).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding?.bottom ?? 0).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

}

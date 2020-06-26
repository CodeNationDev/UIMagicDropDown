//CodeNationDev
import UIKit

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

public func getImage(named: String) -> UIImage {
    let magicBundle: Bundle = {
          var santanderBundle = Bundle()
          if let url = Bundle(for: UIMagicDropdownCell.self).url(forResource: "SUKit", withExtension: "bundle"), let realbundle = Bundle(url: url ) {
              santanderBundle = realbundle
          }
          return santanderBundle
      }()

    return UIImage(named: "\(named)", in: magicBundle, compatibleWith: nil) ?? UIImage()
}

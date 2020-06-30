//
import UIKit

public class MagicLabel: UILabel {

    public var edges: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    fileprivate var action: (() -> Void)?

    override public func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: edges) )
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public func onClick(_ action: (() -> Void)?) {
        self.action = action
    }

    fileprivate func setup() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionSelector)))
    }

    @objc fileprivate func actionSelector() {
        action?()
    }
}

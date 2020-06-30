//
import UIKit


public class UIMagicDropDownTableView: UITableView {

    var theme: MagicDropDownConfig? {
        didSet {
            setupView()
            layoutSubviews()
        }
    }
   
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        separatorStyle = .none
        bounces = false
    }

    func setupView() {
        isUserInteractionEnabled = true
        register(UIMagicDropdownCell.self, forCellReuseIdentifier: "dropcell")
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = theme?.layers?.tableCornerRadius ?? 5.0
        layer.borderWidth = 1.0
        layer.borderColor = theme?.colors?.tableBorderColor?.cgColor ?? UIColor.lightGray.cgColor
    }
}

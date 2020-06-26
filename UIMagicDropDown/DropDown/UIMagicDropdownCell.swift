//
import UIKit

public class UIMagicDropdownCell: UITableViewCell {

    var backView: UIView?
    var theme: MagicDropDownConfig? {
        didSet {
            applyStyles()
        }
    }

    /// Override selection function for custom aspect.
    ///
    /// - Parameters:
    ///   - selected: item selected
    ///   - animated: set animation
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.textLabel?.textColor = theme?.colors?.itemSelectedTextColor ?? .white
        } else {
            self.textLabel?.textColor = theme?.colors?.itemUnselectedTextColor ?? .gray
        }
    }

    /// Init function
    ///
    /// - Parameters:
    ///   - style: cell style
    ///   - reuseIdentifier: name of reuse cell.
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Setup cell properties.
    func setupCell() {
        isUserInteractionEnabled = true
        setupView()
        applyStyles()
    }

    // Setup view inside cell.
    func setupView() {
        backView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        backView!.backgroundColor = .systemBlue
        backView!.layer.cornerRadius = 4
        selectedBackgroundView = backView

        NSLayoutConstraint.activate([
            contentView.rightAnchor.constraint(equalTo: rightAnchor, constant: 5.0),
            contentView.leftAnchor.constraint(equalTo: leftAnchor, constant: -5.0),
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0)
            ])
    }



    func applyStyles() {
        backView?.backgroundColor = theme?.colors?.itemSelectedColor ?? .systemBlue
        backgroundColor = theme?.colors?.itemUnselectedColor ?? .white
        textLabel?.font = theme?.fonts?.itemFont ?? .systemFont(ofSize: 15)
        textLabel?.textAlignment = theme?.texts?.tableTextAlignmrnt ?? .left
    }
}

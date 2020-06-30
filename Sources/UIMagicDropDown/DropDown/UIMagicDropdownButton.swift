//
import UIKit

public class UIMagicDropdownButton: UIButton {

     var theme: MagicDropDownConfig? {
        didSet {
            applyStyles()
            layoutSubviews()
        }
    }

    fileprivate lazy var mainView: UIView = {
        let mv = UIView(frame: .zero)
        return mv
    }()

    public lazy var labelView: UILabel = {
        let view = UILabel()
        view.textColor = self.theme?.colors?.hintTextColor ?? .darkGray
        view.font = self.theme?.fonts?.hintFont ?? .systemFont(ofSize: 17)
        view.textAlignment = .left
        view.text = "Select Option"
        view.isHidden = false
        return view
    }()

    public lazy var floatingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        label.text = " "
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()

    fileprivate lazy var separatorView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1.0, height: 49.0))
        view.backgroundColor = .lightGray
        view.isHidden = false
        return view
    }()

    fileprivate lazy var iconImageview: UILabel = {
        let iv = UILabel(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        iv.isHidden = false
        iv.text = "v"
        iv.textAlignment = .center
        iv.font = UIFont(name: "Copperplate", size: 15)
        return iv
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()

    }

    func setupView() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 5.0
        titleLabel?.isHidden = true
        addSubviews()
    }

    public func addSubviews() {

        mainView.addSubview(labelView)
        mainView.addSubview(floatingLabel)
        mainView.addSubview(separatorView)
        mainView.addSubview(iconImageview)
        addSubview(mainView)

        iconImageview.anchor( top: mainView.topAnchor, right: mainView.rightAnchor, bottom: mainView.bottomAnchor)

        labelView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        iconImageview.translatesAutoresizingMaskIntoConstraints = false

        iconImageview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        iconImageview.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageview.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        separatorView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: iconImageview.leadingAnchor, constant: -8).isActive = true

        floatingLabel.anchor(left: mainView.leftAnchor, top: mainView.topAnchor)

        floatingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        floatingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        floatingLabel.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: -15).isActive = true
        floatingLabel.isHidden = true

        labelView.anchor(left: mainView.leftAnchor, top: floatingLabel.bottomAnchor)

        labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        labelView.topAnchor.constraint(equalTo: floatingLabel.bottomAnchor, constant: -5).isActive = true
        labelView.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: -5).isActive = true

    }

    public func rotateUpArrow() {
        UIView.animate(withDuration: 0.3, animations: {
            self.iconImageview.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        })
    }

    public func rotateDownArrow() {
        UIView.animate(withDuration: 0.3, animations: {
            self.iconImageview.transform = CGAffineTransform(rotationAngle: (2.0 * .pi) / 180.0)
        })
    }

    public func setPlaceholderText(text: String) {
        labelView.text = text
        if (floatingLabel.text != nil) && !(floatingLabel.text!.isEmpty) && (floatingLabel.text! != " ") {

            floatingLabel.isHidden = false

            labelView.anchor(left: mainView.leftAnchor, top: floatingLabel.bottomAnchor, bottom: mainView.bottomAnchor)
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
            labelView.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: -15).isActive = true

        } else {
            floatingLabel.isHidden = true
        }
    }

    func applyStyles() {
        labelView.textColor = theme?.colors?.hintTextColor ?? .darkGray
        labelView.font = theme?.fonts?.hintFont ?? .systemFont(ofSize: 17)
        iconImageview.textColor = theme?.colors?.accessoryTintColor ?? .systemBlue
        separatorView.backgroundColor = theme?.colors?.separatorTintColor ?? .gray
        backgroundColor = theme?.colors?.dropDownBoxBackgroundColor ?? .white
        layer.borderColor = theme?.colors?.borderColor?.cgColor
        layer.cornerRadius = theme?.layers?.boxCornerRadius ?? 3.0
        layer.shadowColor = theme?.shadow?.shadowColor?.cgColor ?? nil
        layer.shadowOpacity = theme?.shadow?.shadowOpacity ?? 0
        layer.shadowOffset = theme?.shadow?.shadowOffset ?? .zero
        layer.shadowRadius = theme?.shadow?.shadowRadius ?? 0.0


    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        labelView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelView.textAlignment = theme?.texts?.boxTextAlignment ?? .left
        applyStyles()
    }
}

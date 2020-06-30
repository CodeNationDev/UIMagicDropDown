//    ___________________________________________
//   |                                    |     |
//   |    Select one option....           |  V  |
//   |____________________________________|_____|
//   |                                          |
//   |    item 1                                |
//   |__________________________________________|
//   |                                          |
//   |    item 2                                |
//   |__________________________________________|
//   |                                          |
//   |    item 3                                |
//   |__________________________________________|

import UIKit


public protocol UIMagicDropDownDelegate: class {
    func dropDownSelected (_ item: UIMagicDropdownData, _ sender: UIMagicDropdown)
    func dropdownExpanded (_ sender: UIMagicDropdown)
    func dropdownCompressed (_ sender: UIMagicDropdown)
}

public extension UIMagicDropDownDelegate {
    func dropdownExpanded (_ sender: UIMagicDropdown) {}
    func dropdownCompressed (_ sender: UIMagicDropdown) {}
}

public struct MagicDropDownConfig {
    public var colors: Colors?
    public var fonts: Fonts?
    public var layers: Layers?
    public var shadow: Shadow?
    public var texts: Texts?
    //MARK: - Colors
    public struct Colors{
        public var dropDownBoxBackgroundColor: UIColor?
        public var dropDownTableBackgroundColor: UIColor?
        public var borderColor: UIColor?
        public var tableBorderColor: UIColor?
        public var hintTextColor: UIColor?
        public var itemSelectedColor: UIColor?
        public var itemUnselectedColor: UIColor?
        public var itemSelectedTextColor: UIColor?
        public var itemUnselectedTextColor: UIColor?
        public var separatorTintColor: UIColor?
        public var accessoryTintColor: UIColor?

        public init(){}
    }
    public struct Fonts {
        //MARK: - Fonts
        public var hintFont: UIFont?
        public var itemFont: UIFont?

        public init(){}
    }
    //MARK: - Layers
    public struct Layers {
        public var boxCornerRadius: CGFloat?
        public var tableCornerRadius: CGFloat?
        public init(){}
    }

    public struct Shadow {
        public var shadowOpacity: Float?
        public var shadowOffset: CGSize?
        public var shadowRadius: CGFloat?
        public var shadowColor: UIColor?
        public init() {}
    }

    public struct Texts {
        public var boxTextAlignment:NSTextAlignment?
        public var tableTextAlignmrnt:NSTextAlignment?
        public init(){}
    }

    public init(){}
}



public class UIMagicDropdown: UIView, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Vars
    public var theme: MagicDropDownConfig? {
        didSet {
            dropButton.theme = theme
            tableView.theme = theme
        }
    }
    public var items: [UIMagicDropdownData]?
    var openclose = false
    private let dropButton = UIMagicDropdownButton()
    private let tableView = UIMagicDropDownTableView()
    /// The tint color to apply to the checkbox button.
    public var color: UIColor = .red
    public var dropDownDelegate: UIMagicDropDownDelegate?
    public var itemSelected: Int? = 0 {
        didSet {
            if  self.itemSelected! < tableView.numberOfRows(inSection: 0) {
                tableView.selectRow(at: IndexPath(row: self.itemSelected!, section: 0) , animated: false, scrollPosition: .middle)
                dropButton.setPlaceholderText(text: items![self.itemSelected!].label)
                dropDownDelegate?.dropDownSelected(items![self.itemSelected!], self)
            }
        }
    }
    private var tableViewheightConstraint: NSLayoutConstraint?
    
    public var hintMessage: String {
        get {
            if dropButton.labelView.text != nil {
                return dropButton.labelView.text!
            } else {
                return "Select an option..."
            }
        }
        set {
            dropButton.labelView.text = newValue
        }
    }

    public var floatingMessage: String {
        get {
            return " "
        }
        set {
            dropButton.floatingLabel.text = newValue
        }
    }


    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public init(theme: MagicDropDownConfig? = nil, items: [UIMagicDropdownData]) {
        super.init(frame: .zero)
        setup()
        self.items = items
        dropButton.theme = theme
        tableView.theme = theme
        self.theme = theme
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Custom setup view
    private func setup() {
        // General
        translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

        // Subviews
        addSubview(dropButton)
        addSubview(tableView)

        //Button target
        dropButton.addTarget(self, action: #selector(UIMagicDropdown.pressButton), for: .touchUpInside)

        // Layout Constraints
        dropButton.translatesAutoresizingMaskIntoConstraints = false

        // Button
        NSLayoutConstraint.activate([
            dropButton.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            dropButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0),
            dropButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0),
            dropButton.heightAnchor.constraint(equalToConstant: 49.0)
        ])

        // Tableview
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: dropButton.bottomAnchor, constant: 3),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0.0)
        ])
        tableViewheightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0.0)
        tableViewheightConstraint?.isActive = true
    }

    // MARK: - Show / Hide TableView
    func show() {
        tableView.theme = theme
        var tableHeight = 47 * 4
        let itemsCount = self.items?.count ?? 0
        if itemsCount < 4 {
            tableHeight = itemsCount * 47
        }

        if #available(iOS 10.0, *) {
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8) {
                self.tableViewheightConstraint?.constant = CGFloat(tableHeight)
                self.layoutSubviews()
            }.startAnimation()
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableViewheightConstraint?.constant = CGFloat(tableHeight)
                self.layoutSubviews()
            })
        }

        dropButton.rotateUpArrow()
        dropDownDelegate?.dropdownExpanded(self)
        if let selectedIndexpath = tableView.indexPathForSelectedRow {
            tableView.scrollToRow(at: selectedIndexpath, at: .middle, animated: true)
        }
    }

    func hide() {
        if #available(iOS 10.0, *) {
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8) {
                self.tableViewheightConstraint?.constant = 0.0
                self.tableView.bounds.origin.y = 0.0
                self.layoutSubviews()
            }.startAnimation()
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableViewheightConstraint?.constant = 0.0
                self.tableView.bounds.origin.y = 0.0
                self.layoutSubviews()
            })
        }
        dropButton.rotateDownArrow()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items!.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "dropcell", for: indexPath) as? UIMagicDropdownCell
        cell?.textLabel?.text = items![indexPath.row].label
        cell?.theme = self.theme
        return cell ?? UIMagicDropdownCell()
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dropButton.setPlaceholderText(text: items![indexPath.row].label)
        dropDownDelegate?.dropDownSelected(items![indexPath.row], self)
        pressButton()
    }

    //Button Target function
    @objc func pressButton() {
        if !openclose {
            show()
            openclose = !openclose
        } else {
            hide()
            openclose = !openclose
        }
    }
}

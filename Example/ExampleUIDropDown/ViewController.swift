//
import UIKit
import UIMagicDropDown


class ViewController: UIViewController {
    var dropItems: [UIMagicDropdownData]?
    let cellID = "dropcell"
    var dropDown:UIMagicDropdown?
    var dropDownIndigo:UIMagicDropdown?
    var dropDownCorn:UIMagicDropdown?
    var dropDownPunch:UIMagicDropdown?

    var indigo: MagicDropDownConfig? = {
        var theme = MagicDropDownConfig()
        let colors:MagicDropDownConfig.Colors = {
            var colors = MagicDropDownConfig.Colors()
            colors.accessoryTintColor = UIColor(named: "Lochmara")
            colors.borderColor = UIColor(named: "Lochmara")
            colors.hintTextColor = UIColor(named: "Lochmara")
            colors.dropDownBoxBackgroundColor = UIColor(named: "BlueWood")
            colors.separatorTintColor = UIColor(named: "Lochmara")
            colors.itemSelectedColor = UIColor(named: "Lochmara")
            colors.itemUnselectedColor = UIColor(named: "BlueWood")
            colors.itemSelectedTextColor = UIColor(named: "Bluewood")
            colors.itemUnselectedTextColor = UIColor(named: "Lochmara")
            colors.tableBorderColor = UIColor(named: "Lochmara")
            return colors
        }()
        let fonts:MagicDropDownConfig.Fonts = {
            var fonts = MagicDropDownConfig.Fonts()
            fonts.itemFont = .systemFont(ofSize: 17)
            fonts.hintFont = .systemFont(ofSize: 17)
            return fonts
        }()
        let layers:MagicDropDownConfig.Layers =  {
            var layers = MagicDropDownConfig.Layers()
            layers.boxCornerRadius = 5.0
            layers.tableCornerRadius = 5.0
            return layers
        }()

        let texts:MagicDropDownConfig.Texts = {
            var texts = MagicDropDownConfig.Texts()
            texts.boxTextAlignment = .center
            texts.tableTextAlignmrnt = .center
            return texts
        }()

        theme.colors = colors
        theme.fonts = fonts
        theme.layers = layers
        theme.texts = texts
        return theme
    }()

    var corn: MagicDropDownConfig? = {
        var theme = MagicDropDownConfig()
        let colors:MagicDropDownConfig.Colors = {
            var colors = MagicDropDownConfig.Colors()
            colors.accessoryTintColor = UIColor(named: "Corn")
            colors.borderColor = UIColor(named: "Corn")
            colors.hintTextColor = UIColor(named: "Corn")
            colors.dropDownBoxBackgroundColor = UIColor(named: "CornTint05")
            colors.separatorTintColor = UIColor(named: "Corn")
            colors.itemSelectedColor = UIColor(named: "Corn")
            colors.itemUnselectedColor = UIColor(named: "CornTint05")
            colors.itemSelectedTextColor = UIColor(named: "CornTint05")
            colors.itemUnselectedTextColor = UIColor(named: "Corn")
            colors.tableBorderColor = UIColor(named: "Corn")
            return colors
        }()
        let fonts:MagicDropDownConfig.Fonts = {
            var fonts = MagicDropDownConfig.Fonts()
            fonts.itemFont = .systemFont(ofSize: 17)
            fonts.hintFont = .systemFont(ofSize: 17)
            return fonts
        }()
        let layers:MagicDropDownConfig.Layers =  {
            var layers = MagicDropDownConfig.Layers()
            layers.boxCornerRadius = 8.0
            layers.tableCornerRadius = 8.0
            return layers
        }()

        theme.colors = colors
        theme.fonts = fonts
        theme.layers = layers
        return theme
    }()

    var punch: MagicDropDownConfig? = {
        var theme = MagicDropDownConfig()
        let colors:MagicDropDownConfig.Colors = {
            var colors = MagicDropDownConfig.Colors()
            colors.accessoryTintColor = UIColor(named: "Punch")
            colors.borderColor = UIColor(named: "Punch")
            colors.hintTextColor = UIColor(named: "Punch")
            colors.dropDownBoxBackgroundColor = UIColor(named: "PunchTint05")
            colors.separatorTintColor = UIColor(named: "Punch")
            colors.itemSelectedColor = UIColor(named: "Punch")
            colors.itemUnselectedColor = UIColor(named: "PunchTint05")
            colors.itemSelectedTextColor = UIColor(named: "PunchTint05")
            colors.itemUnselectedTextColor = UIColor(named: "Punch")
            colors.tableBorderColor = UIColor(named: "Punch")
            return colors
        }()
        let fonts:MagicDropDownConfig.Fonts = {
            var fonts = MagicDropDownConfig.Fonts()
            fonts.itemFont = .systemFont(ofSize: 17)
            fonts.hintFont = .systemFont(ofSize: 17)
            return fonts
        }()
        let layers:MagicDropDownConfig.Layers =  {
            var layers = MagicDropDownConfig.Layers()
            layers.boxCornerRadius = 12.0
            layers.tableCornerRadius = 12.0
            return layers
        }()
        let shadow:MagicDropDownConfig.Shadow = {
            var shadow = MagicDropDownConfig.Shadow()
            shadow.shadowColor = UIColor.lightGray
            shadow.shadowOffset = .zero
            shadow.shadowOpacity = 0.5
            shadow.shadowRadius = 7.0
            return shadow
        }()

        theme.colors = colors
        theme.fonts = fonts
        theme.layers = layers
        theme.shadow = shadow
        return theme
    }()

    var storm: MagicDropDownConfig? = {
           var theme = MagicDropDownConfig()
           let colors:MagicDropDownConfig.Colors = {
               var colors = MagicDropDownConfig.Colors()
            colors.accessoryTintColor = .darkGray
               colors.borderColor = .darkGray
               colors.hintTextColor = .darkGray
               colors.dropDownBoxBackgroundColor = .systemGray5
               colors.separatorTintColor = .darkGray
               colors.itemSelectedColor = .darkGray
               colors.itemUnselectedColor = .systemGray5
            colors.itemSelectedTextColor = .systemGray5
               colors.itemUnselectedTextColor = .darkGray
               colors.tableBorderColor = .darkGray
               return colors
           }()
           let fonts:MagicDropDownConfig.Fonts = {
               var fonts = MagicDropDownConfig.Fonts()
               fonts.itemFont = .systemFont(ofSize: 17)
               fonts.hintFont = .systemFont(ofSize: 17)
               return fonts
           }()
           let layers:MagicDropDownConfig.Layers =  {
               var layers = MagicDropDownConfig.Layers()
               layers.boxCornerRadius = 24.5
               layers.tableCornerRadius = 24.5
               return layers
           }()
           let shadow:MagicDropDownConfig.Shadow = {
               var shadow = MagicDropDownConfig.Shadow()
               shadow.shadowColor = UIColor.lightGray
               shadow.shadowOffset = .zero
               shadow.shadowOpacity = 0.5
               shadow.shadowRadius = 7.0
               return shadow
           }()

           theme.colors = colors
           theme.fonts = fonts
           theme.layers = layers
           theme.shadow = shadow
           return theme
       }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let items:[UIMagicDropdownData] = [
            UIMagicDropdownData(label: "Steve Jobs", value: 33),
            UIMagicDropdownData(label: "Johnny Ive", value: ["Johnny Ive": 44]),
            UIMagicDropdownData(label: "Phil Schiller",value: "Phil Schiller"),
            UIMagicDropdownData(label: "Craig Fedherighi", value: "Craig Fedherighi"),
            UIMagicDropdownData(label: "Steve Wozniak", value: "Steve Wozniak"),
        ]

        dropDown = UIMagicDropdown(items: items)
        dropDown?.theme = indigo
        dropDownIndigo = UIMagicDropdown(theme: corn, items: items)
        dropDownCorn = UIMagicDropdown(theme: punch, items: items)
        dropDownPunch = UIMagicDropdown(theme: storm, items: items)

        dropDown?.dropDownDelegate = self
        dropDownIndigo?.dropDownDelegate = self
        dropDownCorn?.dropDownDelegate = self
        dropDownPunch?.dropDownDelegate = self


        dropDown?.translatesAutoresizingMaskIntoConstraints = false
        dropDownIndigo?.translatesAutoresizingMaskIntoConstraints = false
        dropDownCorn?.translatesAutoresizingMaskIntoConstraints = false
        dropDownPunch?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dropDown!)
        view.addSubview(dropDownIndigo!)
        view.addSubview(dropDownCorn!)
        view.addSubview(dropDownPunch!)

        NSLayoutConstraint.activate([
            dropDown!.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            dropDown!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80.0),
            dropDown!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80.0),

            dropDownIndigo!.topAnchor.constraint(equalTo: view.topAnchor, constant: 200.0),
            dropDownIndigo!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80.0),
            dropDownIndigo!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80.0),

            dropDownCorn!.topAnchor.constraint(equalTo: view.topAnchor, constant: 300.0),
            dropDownCorn!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80.0),
            dropDownCorn!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80.0),

            dropDownPunch!.topAnchor.constraint(equalTo: view.topAnchor, constant: 400.0),
            dropDownPunch!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80.0),
            dropDownPunch!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80.0),
        ])
    }
}

extension ViewController: UIMagicDropDownDelegate {
    func dropDownSelected(_ item: UIMagicDropdownData, _ sender: UIMagicDropdown) {
        print(item.value)
    }

    func dropdownExpanded(_ sender: UIMagicDropdown) {
        view.bringSubviewToFront(sender)
    }


}


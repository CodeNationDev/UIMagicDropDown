# UMagicDropDown
> An elegant and magic dropdown

![Cocoapods](https://img.shields.io/badge/CocoaPods-Ready-green) ![Swift](https://img.shields.io/badge/Swift-5.0-orange)

UIMagicDropDown is a simply but powerful solution for this kind of selection element. Easy for use and integrate, you could make your own design by themes feature.

<!-- ![](header.png) -->

## Features

- Set items of any type.
- Protocol functions for interact with selections.
- Configure colors of all parts, text alignemnts, corner radius and shadows, font type and size.
- Use it by code or Interface Builder.

## Requirements

- iOS +9.0

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `UIMagicDropDown` by adding it to your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!
pod 'UIMagicDropDown'
```

First of all, import the module 😅

``` swift
import UIMagicDropDown
```


## Usage example

First, you must create the items using `UIMagicDropdownData` structure, thats receive an String (the label that shows into DropDown) and an Any element, the object sended when item is selected.
```swift
let items:[UIMagicDropdownData] = [
            UIMagicDropdownData(label: "Steve Jobs", value: 33),
            UIMagicDropdownData(label: "Johnny Ive", value: ["Johnny Ive": 44]),
            UIMagicDropdownData(label: "Phil Schiller",value: "Phil Schiller"),
            UIMagicDropdownData(label: "Craig Fedherighi", value: "Craig Fedherighi"),
            UIMagicDropdownData(label: "Steve Wozniak", value: "Steve Wozniak"),
        ]
```
Then, make the object instance, and pass the items by constructor:

```swift
dropDown = UIMagicDropdown(items: items)
```
Add dropDown to your view, and setup it's constraints:
```swift
view.addSubview(dropDown!)

dropDown?.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
            dropDown!.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            dropDown!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80.0),
            dropDown!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80.0)
])           
```
Now, run your project and see you first MagicDropDown in your app.
![preview1](https://github.com/CodeNationDev/UIMagicDropDown/blob/develop/Preview1.gif)

### Themes!
It is highly probable that you will need customize the apparence of this element, for this, we develop a theming system for provide almost all possibilities of customization.

**You can define a theme object using the following structure:**

<details><summary>Click to expand and show the code</summary>
<p>

```swift
public struct MagicDropDownConfig {
    public var colors: Colors?
    public var images: Images?
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
    public struct Images {
        //MARK: - Images
        public var accessoryImageView: UIImageView?

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
```
</p>
</details>

Wow, that was big... but quiet, it’s easy, all is optional and you only must to provide the parts for customize… or all, if you need define a complete new experience. 

For make you easiest this job, here you have three examples of you can do with that.

<details><summary>Indigo Theme</summary>
<p>

```swift
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

```

</p>
</details>


<details><summary>Corn Theme</summary>
<p>

```swift
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
```

</p>
</details>

<details><summary>Storm Theme</summary>
<p>

```swift
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
```

</p>
</details>

<details><summary>Punch Theme</summary>
<p>

```swift

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
```

</p>
</details>
 
 <p>
 <p>
 Anyway, you can find this themes and implementations in the example project. Once you have define your theme, you can provide it through constructor, or using the public variable “theme” of class UIMagicDropdown.
```swift
dropDown.theme = indigo
```

Anf finally, the result...
![preview2](https://github.com/CodeNationDev/UIMagicDropDown/blob/develop/Preview2.gif?raw=true)

Can you see that? YES!! **my DropDown don't push the view under it**. Do you want to know how?



## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

# Introduction
This component encrypts and persists sensitive data on the device for access in the current or future sessions.

* [GlobileAlertBar](#GlobileAlertBar)
* [GlobileCards](#GlobileCards)
* [GlobileEndingButton](#GlobileEndingButton)
* [GlobileFailedConnection](#GlobileFailedConnection)
* [GlobileErrorHandler](#GlobileErrorHandler)
* [Foundations](#foundations)
* [GlobileModal](#GlobileModal)
* [GlobileInitialButton](#GlobileInitialButton)
* [GlobileIcons](#GlobileIcons)
* [GlobileTextField](#GlobileTextField)
* [GlobileList](#GlobileList)
* [GlobileNavigationBar](#GlobileNavigationBar)
* [GlobileButtonSelector](#GlobileButtonSelector)
* [GlobileCheckBox](#GlobileCheckBox)
* [GlobileDropdown](#GlobileDropdown)
* [GlobileRadioButton](#GlobileRadioButton)
* [GlobilePageController](#GlobilePageController-controller)
* [GlobileProfilePhoto](#GlobileProfilePhoto)
* [GlobileSlider](#GlobileSlider)
* [GlobileStepper](#GlobileStepper)
* [GlobileTabBar](#GlobileTabBar)
* [GlobileTabs](#GlobileTabs)
* [GlobileTertiaryButton](#GlobileTertiaryButton)
* [GlobilePrivateLabel](#GlobilePrivateLabel)
* [GlobileCalendar](#Globilecalendar)
* [GlobileToggleButtonList](#GlobileToggleButtonList)
* [GlobileQuickActionButton](#GlobileQuickActionButton)
* [GlobileLoader](#GlobileLoader)
* [GlobileToast](#GlobileToast)
* [GlobileActionSheet](#GlobileActionSheet)
* [GlobileTextView](#GlobileActionTextViewt)
* [GlobileEmptyState](#GlobileEmptyState)
* [GlobileAccordion](#GlobileAccordion)

# Install

## Automatically
You can use the [Workspace](https://github.com/globile-software/Arch-Workspace) to automatically add this component to your iOS app.

## Manually (with CocoaPods)
Add the following to your Podfile:
```
pod 'SantanderUIKit' , :git => 'git@github.com:globile-software/Arch-Components-iOS.git'

```
Then run:
```
$ pod install
```

# Use

# GlobileAlertBar

## As GlobileViewController extension

For use GlobileAlertBar, extend from our GlobileViewController and add the SantanderAlertBarDelegate protocol:
```swift
class MyViewController: GlobileViewController, GlobileAlertBarDelegate {}
```

### Show AlertBar

Declaration:
```swift
func showGlobileAlertBar(messageHTML: String, actionText: String)
```
 HTML tags are allowed in messageHTML to highlight the required words. To follow the Santander design guidelines, the highlighted words should go between bold and red color(#EC0000) tags.

Code:
```swift
let message = "This <b><font color=#EC0000>AlertBar</font></b> appears as extension of <b><font color=#EC0000>SantanderViewController</font></b>."
let label = "ACTION"
showGlobileAlertBar(messageHTML: message, actionText: label)
```

## As view

Also, AlertBar can be used as view inside an UIViewController. Be careful with the position of the different views so that the AlertBar and its animation are in the desired design.
### Init
Native default init with frame:
```swift
let alertBar = GlobileAlertBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 58))
```
### Configure in ViewController
Add subview to viewController and set delegate:

```swift
view.addSubview(alertBar)
alertBar.alertBarDelegate = self
```
### Show/Hide
Call GlobileAlertBar methods to show or hide AlertBar when needed:

```swift
// Show AlertBar. The message allow HTML tags to follow the Santander design guidelines.
alertBar.show(messageHTML: message, actionText: label)

// Hide AlertBar, if needed. Automatically it disappears after 3 seconds.
alertBar.hide()
```

## Delegate

### Protocol
```swift
public protocol GlobileAlertBarDelegate: class {
    func onClosePressed()
    func onActionPressed()
}
```

Code:
```swift
func onClosePressed() {
    doNothing()
}
func onActionPressed() {
    showExtraInfoAbout()
}
```



# GlobileCards

### Init
Declaration:
Native default init with NSCoder or frame: CGRect

Code:
```swift
card1 = GlobileCards(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
```
```swift
card1 = GlobileCards()
```
```swift
@IBOutlet weak var card4: GlobileCards!
```

### Config
No config is needed. Use the component as native UIView, define constraints, colors and content.




# GlobileEndingButton

### Config
1- Set GlobileEndingButton as custom class in button.

2- Next, sets the aspect property primary/secondary for configure the state of button.

3- Set "Disabled" enable/disable for get a default behaviour.

### In viewcontroller

1- Add IBOutlet or declare it programmatically.
```swift
@IBOutlet weak var endingButton: GlobileEndingButton!
```

2- Add image icon.
```swift
endingButton.setImage(UIImage(named: "menu")!, position: .top, withPadding: 8.0)
```

2.1- Add image fom URL
```let url = URL(string: "https://img.icons8.com/nolan/2x/additional.png")!
endingButton.setCachedImage(url, position: .`left`, withPadding: 10.0, scale: 4.0, placeholder:  UIImage(named: "BAN002"))
```

The button has three styles.
```swift
public enum GlobileEndingButtonStyle {
    case primary, secondary
}
```
and disabled.
```swift
endingButton.isEnabled = true

```
3- Set state.

```swift
endingButton.style = .primary
```

# GlobileFailedConnection 

## Introduction:
Error handling can be applied by using 2 different components:

1.- 'GlobileFailedConnection', which implements 'ConnectionFailedProtocol': Used for general errors.

2.- 'GlobileFailedConnectionBanner': Used as Banner error when connection fails.

## GlobileFailedConnection Use 

Create component variable:
```swift
var errorConnectionView: GlobileFailedConnection?
```

Call instance function:
```swift
errorConnectionView = GlobileFailedConnection.instanceGeneralErrorFromNib()
```
NOTE: Addsubview action is made inside component's code. The programmer does not need to do it.

After instantiating it, call setup function selecting error type:
```swift
//Example calling
    let title = "This is error handling title"
    let subtitle = "This is error handling subtitle"
    let buttonTitle = "Button title"            
    errorConnectionView.setupErrorNibInView(type: .fullScreenError, in: self.view, globileError: errorConnectionView, title: title, subtitle: subtitle, buttonLabel: buttonTitle, delegate: delegate, titleHidden: titleIsHidden, subtitleHidden: subtitleIsHidden)

//Header function
 public func setupErrorNibInView(type: ErrorShowType, in view: UIView? = nil, globileError: GlobileFailedConnection?, title: String? = "", subtitle: String? = "", buttonLabel: String, delegate: ConnectionFailedProtocol? = nil, actionButtonHidden: Bool = false, titleHidden: Bool = false, subtitleHidden: Bool = false) {
```

Input parameters:
* type: can be ErrorShowType
* view: view which will contain error nib.
* globileError: error instance.
* title: title string.
* subtitle: subtitle string.
* buttonLabel: button label.
* delegate: delegate.
* actionButtonHidden: Show/Hide Button.
* titleHidden: Show/Hide Title.
* subtitleHidden: Show/Hide Subtitle.

Setup function will add and place automatically error nib inside the view.

All selectable options are:
```swift
public enum ErrorShowType {
    case fullScreenError            
    case sessionExpiredError        
    case partialError              
    case successMessage             
    case unsuccessMessage           
}
```

## ConnectionFailedProtocol Use 
This protocol will be used for adding the button its action property (onTouch)
```swift
//Protocol code
@objc public protocol ConnectionFailedProtocol {
    func errorActionOnPress()
}
```

After implementing this protocol to the ViewController, function will be able to be filled:

```swift
//Protocol function example
func errorActionOnPress() {
    print("Action after error")
    navigationController?.popViewController(animated: true)
}
```

## GlobileFailedConnectionBanner Use

Create component variable:
```swift
var errorConnectionBanner: GlobileFailedConnectionBanner?
```

Call instance function: 
```swift
 errorConnectionBanner = GlobileFailedConnectionBanner.instanceBannerErrorFromNib()
```

After instantiating it, call setup function selecting error type:
```swift
errorConnectionBanner?.setupBannerErrorNib(in: view, globileError: errorBanner, title: title, topConstrainConstant: distance)
```

Input parameters:
* view: view which will contain error nib.
* globileError: error instance.
* title: title string.
* topConstrainConstant: Distance to TopView.

Setup function will add and place automatically error nib inside the view.


# GlobileErrorHandler

## Native App

#### Use

1- Instance the native component with the convenience init declared. Set title and subtitle.

Init:
```swift
public init(title: String, style: GlobileEndingButtonStyle, action: @escaping () -> ()) {}
```

Use:
```swift
let controller = GlobileAlertController(title: "Title", subtitle: "Subtitle", message: "Are you sure you want to leave “Top up cell phone” process?", actions: [GlobileAlertAction(title: "Go out!", style: .secondary, action: {
            print("Go out!")
        })], completion: {
            print("Alert Controller dismissed.")
        })
```

2- Instance the actions to do and add it to controller object. Limited by 2 actions, more actions added will bi ignored. Set title of button, style between primary/secondary and action to perform.

```swift
 controller.addAction(GlobileAlertAction(title: "Accept!", style: .secondary, action: {
            print("Go out!")
        }))
```

## Hybrid App

A custom initializer has been added to component for use it from web. The params are provides by a json formatted string.

Init:
```swift  
public convenience init(title: String? = nil, subtitle: String? = nil, message: String? = nil, actions: [GlobileAlertAction]? = nil, completion: (() -> ())? = nil) {}
```

Usage:
```swift
let _ = alert.hybridInterface("{\"title\": \"Title\",\"subtitle\": \"Subtitle\",\"message\": \"Message\", \"positiveButtonText\": \"Accept\", \"negativeButtonText\": \"Cancel\"}")
        present(alert, animated: true)        
```

# Foundations

The component do not requires installation, both colours and fonts are included within the Archetype.

Colors:
```swift
let color = UIColor(named: "BostonRed")
```

Fonts
```swift
let customFont = UIFont(name: "SantanderFont", size: UIFont.systemFontSize)
let customLabel = UILabel()
customLabel.font = customFont
```

# GlobileModal

## Native App

#### Use

1- Instance the native component with the convenience init declared. Set image, title, subtitle, message, buttons and any customView. You can decide the views you want to show in the modal by setting the init param to nil.

Init (Simple mode):
```swift
public convenience init(_ image: UIImage?, _ title: String?, _ subtitle: String?, _ message: String?, _ actions: [GlobileModalAction])
```

Init (Custom mode):
```swift
public convenience init(_ title: String?, _ customView: UIView?, _ actions: [GlobileModalAction])
```

2- Instance the actions to do and add it to controller object. Limited by 2 actions, more actions added will bi ignored. Set title of button, style between primary/secondary/tertiary and action to perform.

GlobileModalAction Init:
```swift
 public init(title: String, style: GlobileEndingButtonStyle, action: GlobileModalActionCompletion?)
```

GlobileModalActionCompletion:
```swift
public typealias GlobileModalActionCompletion = (GlobileModal)->()
```


Use:
```swift

let action1 = GlobileModalAction(title: "Cancel", style: .tertiary) { alert in
  //Do something here or set it to nil
}

let action2 = GlobileModalAction(title: "Something to do", style: .secondary) { alert in
  //Do something here
}

let modal = GlobileModal(_ image: nil, _ title: "Example title", _ subtitle: "Any subtitle", _ message: "One message", _ actions: [action1, action2])

anyViewController.present(modal, animated: true, completion: nil)
```

# GlobileInitialButton

### Config
1- Set GlobileInitialButton as custom class in button.

2- Set GlobileInitialButton properties: size (M, L, XL), image, icon color, and icon position.

### In viewcontroller

1- Add IBOutlet or declare it programmatically.
```swift
@IBOutlet weak var initialButton: GlobileInitialButton!
```

2- Add image icon.
Declaration:
```swift
public func setInitialButton (size: GlobileInitialButtonSize, _ icon: UIImage?, iconColor: GlobileInitialButtonIconStyle, position: GlobileButtonPosition = .left)
```
Code:
```swift
initialButton.setInitialButton(size: .extralarge, UIImage(named: "BAN002"), iconColor: .red, position: .top)
```

### Properties and methods
#### Tint icon
Tint button's icon with preferred color from the following list: red, darkSky, accesibleSky, darkGrey, white, darkTurquoise.
```swift
initialButton.iconTintColor = .red
```

#### Button size
Choose from defined button sizes medium (44px), large(56px) or extralarge(72px, or 88px when text has two lines).
```swift
initialButton.buttonSize = .extralarge
```

#### Size for two lines text
Sets an extra height for the extralarge size button as if the text had two lines. This property sets button height to 88px even if text has just one line.
```swift
initialButton.addTwoLinesHeight = true
```

#### Add image fom URL
Load image from URL to add as button icon. Then set the button size.
Declaration:
```swift
public override func setCachedImage(_ url: URL, position: GlobileButtonPosition, withPadding padding: CGFloat = 8.0, scale: CGFloat, placeholder: UIImage?)
```
Code:
```swift
let url = URL(string: "https://img.icons8.com/nolan/2x/additional.png")!
initialButton.setCachedImage(url, position: .`left`, withPadding: 8.0, scale: 4.0, placeholder:  UIImage(named: "BAN002"))
initialButton.buttonSize = .large
```


# GlobileInitialButton2
This version of GlobileInitialButton component collects the design specifications given for size, number of lines of text, margins...
### Config
1- Set GlobileInitialButton2 as custom class in button.

2- Set GlobileInitialButton2 properties: size (M, L, XL), image, icon color, and icon position.

### In viewcontroller

1- Add IBOutlet or declare it programmatically.
```swift
@IBOutlet weak var initialButton: GlobileInitialButton2!
```

2- Add image icon.
Declaration:
```swift
public func setInitialButton(size: InitialButtonSize, _ icon: UIImage?, iconColor: InitialButtonIconStyle, position: InitialButtonPosition = .left)
```
Code:
```swift
initialButton.setInitialButton(size: .extralarge, UIImage(named: "BAN002"), iconColor: .darkGrey, position: .top)
```

### Properties and methods
#### Tint icon
Tint button's icon with preferred color from the following list: red, darkSky, accesibleSky, darkGrey, darkTurquoise.
```swift
initialButton.iconTintColor = .red
```

#### Button size
Choose from defined button sizes medium (44px), large(56px) or extralarge(72px).
```swift
initialButton.buttonSize = .extralarge
```

#### Buttons per line
Gives different margin settings depending on whether one or two buttons are placed on a line.
```swift
initialButton.buttonOptions = .oneOption
```

#### Add image fom URL
Load image from URL to add as button icon. Then set the button size.
Declaration:
```swift
public func setCachedImage(_ url: URL, buttonSize: InitialButtonSize, position: InitialButtonPosition, withPadding padding: CGFloat = 4.0, scale: CGFloat, placeholder: UIImage?)
```
Code:
```swift
let url = URL(string: "https://img.icons8.com/nolan/2x/additional.png")!
initialButton.setCachedImage(url, buttonSize: .extralarge, position: .top, scale: 4.0, placeholder:  UIImage(named: "BAN002"))
```

# GlobileIcons

### Use

1- Initialize component with image, color and size.

Declaration:
```swift
convenience init(icon: UIImage?, color: GlobileIconColor, size: GlobileIconSize) {}
```

Code:
```swift
var iconX = GlobileIcons(icon: UIImage(contentsOfFile: "BDA"), color: .red, size: .small)
```

2- Set image if use another initializer.

Declaration:
```swift
public func setImage (_ icon: UIImage?, color: GlobileIconColor, size: GlobileIconSize)
```

Code:
```swift
iconX.setImage(UIImage(named: "BAN02"), color: .red, size: .large)
```

3- Add badge when needed.

Declaration:
```swift
public func addBadge(badgeNumber: Int)
```
Code:
```swift
 iconX.addBadge(badgeNumber: 2)
```

4- Add image fom URL

Declaration: 
``` swift
  public func setCachedImage(_ url: URL?, color: GlobileIconColor, size: GlobileIconSize, placeholder: UIImage?)
```

Code:
``` swift
  let url = URL(string: "https://img.icons8.com/nolan/2x/additional.png")!
  icon!.setCachedImage(url, color: .gray, size: .large, placeholder: UIImage(named: "BAN002"))
```

# GlobileTextField

### Init

Default initializer with NSCoder for IB and CGRect in programatically mode.
```swift
var santanderTextField: GlobileTextField!
```

To configure as password input
```swift
passwordTextField.isSecureTextEntry = true
```

### Properties and methods
#### TextField 
GlobileTextField is a UIView that includes a set of views with UITextField to which its properties can be modified. The default case does not have helpText.
Declaration:
```swift
@IBOutlet weak public var textField: GlobileTextField!
```
#### Placeholder
Declaration:
```swift
@IBInspectable public var placeholder: String?
```
Code:
```swift
santanderTextField.placeholder = "User name"
```

#### Right icon image
Declaration:
```swift
public var rightIcon: UIImage? = nil
```
Code:
```swift
santanderTextField.rightIcon = UIImage(named: "user_icon")
```

#### Right icon tint
```swift
santanderTextField.iconColor = .santanderRed
```
```swift
public enum GlobileIconColors {
    case santanderRed, mediumGrey, darkGrey, darkSky
}
```

#### TextField text
Declaration:
```swift
public var text: String?
```
Code:
```swift
nameTextfield.text = "Mary"
```

#### Bottom label text
You can set the help text at bottom or get an action when the label is clicked:
Declaration:
```swift
@IBInspectable public var helpText: String?
// or
public func setBottomLabel(_ helpText: String, action: (() -> Void)? = nil)
```
Code:
```swift
nameTextfield.helpText = "User name has to be place here."
nameTextfield.setBottomLabel("User name has to be place here.", action: {
    print("User name")
})
```

### Count label text
You can set the maximun length of the text, and also, when writing in the placeholder, see how many characters are left.
Declaration:
```swift
@IBInspectable public var charCount: Int
````
Code:
```swift
nameTextfield.charCount = 10
```

#### Icon onClick
Declaration:
```swift
public func onIconClick(_ action: (() -> Void)?) {}
```
Code:
```swift
santanderTextField.onIconClick {
    print("onIconClick")
}
```

#### Clear onClick
Declaration:
```swift
public func onClearClick(_ action: (() -> Void)?) {}
```
Code:
```swift
santanderTextField.onClearClick {
    print("onClearClick")
}
```

#### Change State
Declaration:
```swift
public func changeState(_ state: GlobileFloatTextFieldState)
public enum GlobileFloatTextFieldState {
    case `default`
    case error
}
```
Code:
```swift
santanderTextField.changeState(.error)
```

#### Background theme
Declaration:
```swift
public var backgroundTheme: BackgroundMode
public enum BackgroundMode {
        case sky, white
    }
```
Code:
```swift
santanderTextField.backgroundTheme = .sky
```

#### Delegate
Implements UITextFieldDelegate to propagate methods.
Declaration:
```swift
// Protocol
public protocol GlobileTextFieldDelegate: UITextFieldDelegate {}
// Delegate variable
 public var delegate: GlobileTextFieldDelegate?
```
Code:
```swift
santanderTextField.delegate = self
```

#### Hide separator
Declaration:
```swift
public var hideSeparator: Bool = false {
      didSet {
           separatorView.isHidden = hideSeparator
          }
      }
```
Code:
```swift
santanderTextField.hideSeparator = true
```

#### Hide helpText
Declaration:
```swift
public var hideHelpText: Bool = false {
       didSet {
            bottomLabel.isHidden = hideHelpText
           }
   }
```
Code:
```swift
santanderTextField.hideHelpText = true
```

#### Input Mode
Declaration:
```swift
public var inputMode: InputType = .´default´ {
    didSet {
        switch inputMode {
            case .´default´:
                textField.keyboardType = .default
            case .amount:
                textField.keyboardType = .decimalPad
            case .amountWCurrency:
                textField.keyboardType = .decimalPad
        }
    }
}

```
Code:
```swift
santanderTextField.inputMode = .amount
```

# GlobileList

### Init
Add a UITableView to your ViewController and set its custom Class as GlobileList and instance it:
```swift
var myTableView: GlobileList = GlobileList()
```


### Config
1- Place your GlobileList in your ViewController.

2- Register your cells in the usual way in your UITableView.

3- Extends UITableViewDataSource and UITableViewDelegate in your UIViewController if needed and then add it to your SantanderList.

4- Add UITableView methods to fill your list with cell elements as usual.

Code:
```swift
override func viewDidLoad() {
    super.viewDidLoad()

    myTableView = GlobileList(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: 0))
    self.view.addSubview(myTableView)
    myTableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
    myTableView.dataSource = self
    myTableView.delegate = self
    myTableView.rowHeight = UITableView.automaticDimension
    myTableView.estimatedRowHeight = 100

 }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    ...
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return elements.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath as IndexPath) as! CustomCell
    cell.element = elements[indexPath.row]
    cell.delegate = self
    return cell
}
```

### Set table bounces
Enable or disable table bounces. Configured by default as false.

Declaration:
```swift
public func setBounce(isActive: Bool = false)
```

Code:
```swift
myTableView.setBounce(isActive: true)
```

### Enable Interaction
Enable or disable user interaction in GlobileList cells, this also change some design styles like separator insets.
Declaration:
```swift
public func setInteractionEnabled(enabled: Bool)
```
Code:
```swift
myTableView.setInteractionEnabled(enabled: false)
```

### Card Style
Change the GlobileList design to insert the whole list inside a card.
Declaration:
```swift
public func setCardStyle()
```
Code:
```swift
 myTableView.setCardStyle()
```
## Cell
 The component GlobileCell it is a cell in which two texts are shown as key-values with the required design. You can use this cell in any UITableView and in our component GlobileList.

Declaration:
```swift
let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GlobileCell
```

Set text:
```swift
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! GlobileCell
        cell.leftLabel.text = item[indexPath.row].key
        cell.rightLabel.text = item[indexPath.row].value
        return cell
    }
```


# GlobileNavigationBar

### Init

No init is needed, for use Navigation Bar, extends your ViewController from CoreViewController and Navigation Bar is included.
```swift
final class ViewController: CoreViewController {}
```

### Title

Sets the title of navigation. Two options, title(text) or image. Its defined by following enum:
```swift
public enum NavigationTitle {
    case logo
    case title(String)
    case titleANDsubtitle(String, String)
}
```
Declaration:
```swift
public var navTitle: NavigationTitle
```

Code:
```swift
 navTitle = .logo
 navTitle = .title("MyTitle")
  navTitle = .titleANDsubtitle("MyTitle", "MySubTittle")
```

### Button for Navigation Bar
Base button for add to navigation bar. Defined by following structure:
```swift
// MARK: Santander Button struct
public struct NavBarButton {
    //Style: Back, Menu and custom
    public enum Style {
        case back
        case menu
        case custom(UIImage)
    }
    var style: Style
    var action: (() -> Void)?

    public init(style: Style, action: (() -> Void)? = nil) {
        self.style = style
        self.action = action
    }

    public func returnImage() -> UIImage? {
        switch style {
        case .back:
            return SantanderImage.navigation_back
        case .menu:
            return SantanderImage.menu
        case .custom(let image):
            return image
        }
    }
}

```

You can hide/show the back button setting this variable to false/true

**Use:**
```swift
hiddeneBackButton = true | false
```



### Right Navigation Buttons

Our NavigationBar allows two configurable buttons. You can setup them as following examples:

**firstRightButton:**
```swift
firstRightNavigationButton = NavBarButton(style: .menu, action: {
    print("Botón Menú")
})
```
**secondRightButton:**
```swift
secondRightNavigationButton = NavBarButton(style: .custom(UIImage(named: "thumb1")!), action: {
    print("Botón check")
})
```

Also, right buttons can be hidden setting up the following variable to true/false
```swift
hiddenRightButtons = true | false
```
If you setted the buttons an later you hide them, don't worry, there will be there when you set up as visible again.

### Left Navigation Button

Left navigation button has a custom arrow and you can hide/show it setting up the following variable:

```swift
hiddeneBackButton = true | false

```

Finally, you can hide the NavigationBar setting up the following variable:
```swift
hiddenNavBar = true | false
```


# GlobileButtonSelector

### Init

Declaration:
```swift
public override init (items: [Any]?)
```

Code:
```Swift
GlobileButtonSelector(items: ["Button 1", "Button 2", "Button 3"])
```


# GlobileCheckBox

## Checkbox Button
### Init

Code init and pre-config:

```swift
let checkboxButton: GlobileCheckBox = {
        let checkbox = GlobileCheckBox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.text = "My card is used abroad"
        checkbox.infoButtonEnabled = true
        checkbox.enabledCheckbox = true
        return checkbox
    }()
```

### Color
Defined by following enum:
```swift
public enum GlobileCheckboxTintColor {
    case red
    case turquoise
}
```

Declaration:
```swift
public var color: GlobileCheckboxTintColor
```

Code:
```swift
checkboxGroup?.color = .turquoise
```

### Text
Native text property.

Code:
```swift
checkbox.text = "My card is used abroad"
```



## Checkbox Group

### Init
Declaration:
```swift
public init(checkboxes: [GlobileCheckBox]) {
    self.checkboxes = checkboxes
    super.init(frame: .zero)
    addSubviews()
}
```

Code:
```swift
private var checkboxGroup: GlobileCheckBoxGroup?
let checkboxes = [checkbox1, checkbox2, checkbox3, checkbox4]
checkboxGroup = GlobileCheckBoxGroup(checkboxes: checkboxes)
```

### Delegate

#### Protocol
```swift
public protocol GlobileCheckboxGroupDelegate: class {
    func didSelect(checkbox: GlobileCheckBox)
    func didDeselect(checkbox: GlobileCheckBox)
}
```

Declaration:
```swift
public var delegate: GlobileCheckboxGroupDelegate?
```

Code:
```swift
extension CheckboxViewController: GlobileCheckboxGroupDelegate {

    func didSelect(checkbox: GlobileCheckBox) {
        print("SELECT: \(checkbox.text ?? "")")
    }

    func didDeselect(checkbox: GlobileCheckBox) {
        print("DESELECT: \(checkbox.text ?? "")")
    }
}
```
The component response through delegated function when user change the selection.

### Checkboxes
Checkbox objects for group.

Declaration:
```swift
public var checkboxes: [GlobileCheckBox]
```

Code:
```swift
checkboxGroup?.checkboxes = checkboxes
```

### Select All
Declaration:
```swift
public func selectAll ()
```
Code:

```swift
checkboxGroup?.selectAll()
```

### Deselect All
Declaration:
```swift
public func deselectAll ()
```
Code:

```swift
checkboxGroup?.deselectAll()
```

# GlobileDropdown

### Init
Declaration:
Native default init with NSCoder or frame: CGRect

Code:
```swift
let dropdown = GlobileDropdown<T>()
```
### Data class object
The class object to manage the data shown in the dropdown menu and received when the element is clicked is GlobileDropdownData, defined by the following class:
```swift
public class GlobileDropdownData<T> {
    public var label: (String)
    public var value: (T)? = nil

    public init(label: String, value: T?) {
        self.label = label
        self.value = value
    }
}
```
### Items
Declaration:
```swift
 public var items: [GlobileDropdownData<T>]?
```

Code:
```swift
// Example class
public class UserSelector {
    var name: String? = nil
    var surname: String? = nil
    var id: Int
    init(name: String?, surname: String?, id: Int) {
        self.name = name
        self.surname = surname
        self.id = id
    }
}
...

// Add items to Dropdown
override func viewDidLoad() {
        super.viewDidLoad()

        let item1 = GlobileDropdownData(label: "David Martín", value: UserSelector (name:"David", surname: "Martín", id:123))
        let item2 = GlobileDropdownData(label: "Laura Arranz", value: UserSelector (name:"Laura", surname: "Arranz", id:456))
        let item3 = GlobileDropdownData(label: "Naufal Aro El Morabet", value: UserSelector (name:"Naufal", surname: "Aro El Morabet", id:789))
        let item4 = GlobileDropdownData(label: "Carlos Gonzalez", value: UserSelector (name:"Carlos", surname: "Gonzalez", id:210))
        let item5 = GlobileDropdownData(label: "Iván Martín", value: UserSelector (name:"Iván", surname: "Martín", id:345))

        items = [item1, item2, item3, item4, item5]

        dropdown.items = items
}
```
### Color
The color can switch between red or turqoise, defined by following enum:
```swift
public enum GlobileDropDownTintColor {
    case red
    case turquoise
}
```

Declaration:
```swift
public var color: GlobileDropDownTintColor = .red
```

Code:
```swift
dropdown.color = .turquoise
```

### Hint message
Sets selector hint text when no option is selected:

Declaration:
```swift
public var hintMessage: String
```

Code:
```swift
dropdown.hintMessage = "Select an user"
```

### Floating label message
Sets text for floating label above hint text. If it is not defined it will not appear:

Declaration:
```swift
public var floatingMessage: String
```

Code:
```swift
dropdown.floatingMessage = "User:"
```

### Error message
Sets error text below selector:

Declaration:
```swift
public var errorMessage: String
```

Code:
```swift
dropdown.errorMessage = "Please, select an option"
```
### State
Switched between normal and error defined in following enum:
```swift
public enum GlobileDropDownErrorState {
    case error
    case normal
}
```
Declaration:
```swift
public func errorState(state: GlobileDropDownErrorState)
```

Code:
```swift
dropdown.errorState(state: .error)
```

## Delegate

### Protocol
```swift
public protocol GlobileDropDownDelegate: class {
    func dropDownSelected <T>(_ item: GlobileDropdownData<T>)
}
```
Declaration:
```swift
func dropDownSelected <T>(_ item: GlobileDropdownData<T>)
```

Code:
```swift
func dropDownSelected<T>(_ item: GlobileDropdownData<T>) {
        var text = item.label
        if (item.value is UserSelector){
            let name = (item.value as! UserSelector).name ?? text
            let id = (item.value as! UserSelector).id
            text = name + ". Id: " + String(id)
        }
        labelItemSelected.text = text
    }
```



# GlobileRadioButton

## Radio Button

### Init
You have 2 ways to init this component in function of required apparence:

The RadioButton will appear with accessory in left position, with 24x24px size and red color.
```swift
let radioButton = GlobileRadioButton()
```
The next construction can configure the layout type (left, right or type2), the acessory size (S or M, 24x24 or 32x32) and accessory color (turqoise or red). All of three are initialized by default values (left layout, S size and red color)
Definition:
```swift
public init(type: RadioButtonPosition, 
            accessorySize: AcccesorySize = .S, 
            accessoryColor: RadioButtonColor = .red) 
```
### Constructor Params:

**AccessorySize**
Defines the size of radiobiutton circle, S or M corresponds to 24 or 32ppx sizes.
```swift
public enum AcccesorySize {
    case M, S

    public var size: CGFloat {
        switch self {
        case .M: return 32.0
        case .S: return 24.0
        }
    }
}
```

**AccessoryColor**
Defines the color of two avaliable for radiobutton circle frame:
```swift
public enum RadioButtonColor {
    case red, turquoise
}
```
**Type**
Define the layout of three available for RadioButton component:
```swift
public enum RadioButtonPosition {
    case left, right, type2
}
```

Examples:
```swift
let radioButton1 = GlobileRadioButton(type: .type2, accessorySize: .M, accessoryColor: .turquoise)

let radioButton2 = GlobileRadioButton(type: .type2, accessorySize: .S)

let radioButton4 = GlobileRadioButton( accessorySize: .S)

let radioButton5 = GlobileRadioButton(accessoryColor: .red)

let radioButton6 = GlobileRadioButton(type: .type2)

let radioButton2 = GlobileRadioButton(type: .type2, accessoryColor: .red)

```

### Class Properties

### isSelected

Declaration:
```swift
public var isSelected: Bool
```
Code:
```swift
radioButton.isSelected
```

### infoButtonEnabled
@IBInspectable variable for interface builder custom configuration.

Declaration:
```swift
public var infoButtonEnabled: Bool = false
```

### radioButtonColor
Switch between red and turqoise defined by the following enum:
```swift
public enum RadioButtonColor {
    case red, turquoise
}
```

Declaration:
```swift
public var radioButtonColor: RadioButtonColor = .red
```
Code:
```swift
radiobutton.radioButtonColor = .turquoise
```



## RadioButton Group

### Init

Custom init with Radiobutton objects:
Declaration:
```swift
 public init(radioButtons: [GlobileRadioButton], position: RadioButtonPositionStack) {
     self.radioButtons = radioButtons
     switch position {
         case .left:
             for button in radioButtons {
                 button.setPosition = .left
             }
             
         case .right:
             for button in radioButtons {
                 button.setPosition = .right
             }
     }
     super.init(frame: .zero)
     addSubviews()
     setupLayout()
     setupSubviews()
 }
```
Code:
```swift
    let group = GlobileRadioButtonGroup(radioButtons: buttons, position: .left )
```

### radioButtons

Sets radionuttons after init with following public var:
Declaration:
```swift
public var RadioButtons: [GlobileRadioButton]?
```

Code:
```swift
group.radioButtons = buttons
```

## Delegate
Component response throwg following delegate
### Protocol
```swift
public protocol GlobileRadioButtonGroupDelegate: class {
    func didSelect(radioButton: GlobileRadioButton)
}
```
Code:
```swift
extension RadioButtonGroupViewController: GlobileRadioButtonGroupDelegate {

    func didSelect(radioButton: GlobileRadioButton) {
        print(radioButton.text ?? "")
    }
}
```
# GlobilePageController
### Init
Interface builder init by ```@IBOutlet```
Code:
```swift
@IBOutlet weak var globilePageControl: GlobilePageController!
```
### setNumberOfPages
Declaraton:
```swift
setNumberOfPages (_ pages: Int)
```
Code:
```swift
globilePageControl.setNumberOfPages(9)
```
### increase
Declaration:
```swift
increase (_ offset: Int)
```
Code:
```swift
globilePageControl.increase(1)
```

### decrease
Declaration:
```swift
increase (_ offset: Int)
```
Code:
```swift
globilePageControl.decrease(1)
```
### getCurrentPage
Declaration:
```swift
getCurrentPage()
```
Code:
```swift
let currentPage = globilePageControl.getCurrentPage()
```
### setCurrentPage
Declaration:
```swift
setCurrentPage (_ page: Int)
```
Code:
```swift
globilePageControl.setCurrentPage(3)
```


# GlobileProfilePhoto

### Init
Add a UIView to your View in InterfaceBuilder, set custom Class as GlobileProfilePhoto and create ```@IBOutlet```
```swift
@IBOutlet weak var mainView: GlobileProfilePhoto!
```
Or instance it programatically
```swift
var mainView = GlobileProfilePhoto()
```

### setInitialsWithName
Declaration:
```swift
public func setInitialsWithName(name: String?) throws
```
Code:
```swift
do {
    try mainView.setInitialsWithName(name: "david martin saiz")
} catch let error {
    print(error.localizedDescription)
   }
```
Operation cases:
- If passed one name, the component shows one initial.
- If passed two names, the component shows two initials.
- If passed three or more names, the component shows two initials. It
takes first and last names.
- If passed "", the component throws a exception.

### setInitials
Declaration:
```swift
public func setInitials(initials: String?) throws
```
Code:
```swift
do {
    try mainView.setInitials(initials: "DM")
} catch let error {
    print(error.localizedDescription)
}
```
Operation cases:
- If passed one initial, the component shows one initial.
- If passed two initials, the component shows two initials.
- If passed three or more initials, the component shows two initials. It
takes first and last initial.
- If passed "", the component throws a exception.

### addBadge
Declaration:
```swift
public func addBadge(badgeNumber: Int)
```
Code:
```swift
 mainView.addBadge(badgeNumber: 2)
```
If pass 0 as badgeNumber param value, adds badge without number.

### setImage
Declaration:
```swift
public func setImage (_ photo: UIImage?)
```
Code:
```swift
 mainView.setImage(UIImage(named: "my_photo"))
```

### tintBackground
Code:
```swift
mainView.tintBackground = .globileTurquoise
````
The tintBackground only can be globileTurquoise, globileYellowTint80, globileBlue, globileSantanderRed
If the tintBackground is not defined, a random one will be assigned (globileTurquoise, globileYellowTint80, globileBlue, globileSantanderRed)

# GlobileSlider

### Init & Config

Code:
Standard Slider:
```swift
let santanderSlider: GlobileSlider = {
        let slider = GlobileSlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 200000.0
        slider.isContinuous = true
        slider.color = .red
        slider.minimumText = "0€"
        slider.maximumText = "200.000€"
        slider.selectedMaximumValue = 100000.0
        return slider
    }()
   ```
Range Slider:
```swift
let santanderSlider4: GlobileSlider = {
        let slider = GlobileSlider()
        slider.minimumValue = 1.0
        slider.maximumValue = 5.0
        slider.isContinuous = false
        slider.step = 1.0
        slider.isRangeable = true
        slider.color = .turquoise
        slider.minimumText = "1"
        slider.maximumText = "5"
        slider.selectedMaximumValue = 4.0
        return slider
    }()
```

### Style Color

Two styles, default (red and white text) or light (white and red text) defined in following enum:

```swift
public enum GlobileSliderColor {
    case red
    case turquoise
}
```
Declaration:
```swift
 /// The tint color to apply to the slider's track line and thumbs.
    public var color: GlobileSliderColor = .red {
        didSet {
            switch color {
            case .red:
                slider.colorBetweenHandles = redColor
                slider.handleImage = UIImage(named: "thumb_red")
            case .turquoise:
                slider.colorBetweenHandles = turquoiseColor
                slider.handleImage = UIImage(named: "thumb_turquoise")
            }
        }
    }
```
Code:
```swift
slider.color = .turquoise
```
### Delegate

#### Protocol
```swift
public protocol GlobileSliderDelegate: class {
    func globileSlider(_ slider: SantanderSlider, didChange minimumValue: Float, maximumValue: Float)
}
```

Declaration:
```swift
public var delegate: GlobileSliderDelegate?
```

Code:
```swift
extension SliderViewController: GlobileSliderDelegate {
   func globileSlider(_ slider: GlobileSlider, didChange minimumValue: Float, maximumValue: Float) {
        // do something.
    }
}
```
The component response through delegated function when user changes slider position.


# GlobileStepper

### Init
Default initializer with NSCoder in programatically mode.
Code:
```swift
 var globileStepper: GlobileStepper?
 globileStepper = GlobileStepper(numberOfSegments: 4)
```

### numberOfSegments
Declaraton:
```swift
public var numberOfSegments: Int
```
Code:
```swift
globileStepper?.numberOfSegments = 4
```
### previous
Declaration:
```swift
public func previous()
```
Code:
```swift
globileStepper?.previous()
```

### next
Declaration:
```swift
public func next()
```
Code:
```swift
globileStepper?.next()
```

# GlobileTabBar

### Init
```swift
let globileTabBarController = GlobileTabBar()
```
### setViewControllers
Declaration:
```swift
override public func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
```
Code:
```swift
globileTabBarController.setViewControllers(viewControllers, animated: true)
```

### setBadgeNumber
You can set a badge with number of notifications (option). First param indicates the number into badge. Second param, specify the item to add badge.

Declaration:
```swift
public func setBadgeNumber(_ count: Int, for item: Int) throws
```

Code:
```swift
do { try globileTabBarController.setBadgeNumber(3, for: 0)} catch let error {print(error)}
```


# GlobileTabs

### Init
Instance the native component, set the list with tab class objects and add the component as subview or push as UIViewController.

Code:
```swift
let tabsController = GlobileTabs()
```
### Data class object
The class object to manage the data shown in the tab, label text, image and view controller to loads:
```swift
public struct GlobileTab {
    var title: String
    var icon: UIImage?
    var viewController: UIViewController

    public init(title: String, icon: UIImage?, viewController: UIViewController) {
        self.title = title
        self.icon = icon
        self.viewController = viewController
    }
}
```
### Items
This component shows scrollable menu tab if there is more than three tabs.
Declaration:
```swift
public var tabsList: [GlobileTab]
```

Code:
```swift
// Example tab element list
    let tab1 = GlobileTab(title: "Left", icon: UIImage(named: "icon1"), viewController: Tab1ViewController())
    let tab2 = GlobileTab(title: "Center", icon: UIImage(named: "icon2"), viewController: Tab2ViewController())
    let tab3 = GlobileTab(title: "Right", icon: UIImage(named: "icon3"), viewController: Tab3ViewController())
    let tabs = [tab1, tab2, tab3]
...

// Add component as subview
    let tabsController = GlobileTabs()
    tabsController.tabsList = tabs
    tabsController.view.frame = self.view.frame
    self.addChild(tabsController)
    self.view.addSubview(tabsController.view)
    tabsController.didMove(toParent: self)

// Or push component as view controller
    let tabsController = GlobileTabs()
    tabsController.tabsList = tabs
    navigationController?.pushViewController(tabsController, animated: true)
```

### Select tab item
Declaration:
```swift
    public func scrollToMenuIndex(menuIndex: Int, animated: Bool){}
```

Code:
```swift
    tabsController.scrollToMenuIndex(menuIndex: 1, animated: true)
```

# GlobileTertiaryButton

### Config
1- Set GlobileTertiaryButton as custom class in button.

2- Next, sets the aspect property from the following list: primaryRed, secondaryTurquoise, secondaryYellow, secondaryLimeGreen, secondaryBlue, secondaryPurple, secondaryDarkTurquoise for configure the state of button.

### In viewcontroller

1- Add IBOutlet or declare it programmatically.
```swift
@IBOutlet weak var tertiaryButton: GlobileTertiaryButton!
```

2- Set button title, with the link text underlined.
```swift
tertiaryButton.setTitle(link: "Visit santander", text: "whenever you want.")
```

3- Add image icon.
```swift
tertiaryButton.setIcon(UIImage(named: "menu"))
```

The button has many selectable styles.
```swift
public enum GlobileTertiaryButtonStyle {
    case primaryRed, secondaryTurquoise, secondaryYellow, secondaryLimeGreen, secondaryBlue, secondaryPurple, secondaryDarkTurquoise
}
```

4- Set state from GlobileTertiaryButtonStyle.
```swift
tertiaryButton.style = .primaryRed
```

# GlobilePrivateLabel

### Config
It`s necessary use initial configuration like:
```swift
let label = GlobilePrivateLabel(privateMode: privacyMode, animatedDuration: 0.0)
```
### Use
The component had a public enum for set privacy mode. You can switch it to on/off to set private mode. The following function manage this action:
```swift
public func setPrivate(privacyMode: PrivacyMode, blurEffect: UIBlurEffect.Style = .extraLight)
```
Also, has a public variable to get the estate, for make it usefull for developer that can take it state to use as switch for another actions.


### In viewcontroller

The component can works sincronized with the GlobileViewController. This component had the proximity sensor manager, and all bussiness logic to hide all visible PrivateLabels. It do a recursive search into all subviews and switch on/off all of this privateLabels.

For this feature, you only need set two properties on setting true this public variable.
```swift
open var privateMode: Bool = false {
      didSet {
          var statusPrivacyMode = PrivacyMode.off
          if self.privateMode {
              statusPrivacyMode = .on
          }
          switchAllPrivateLablesProgrammatically(privacyMode: statusPrivacyMode)
      }
  }
  
  
  open var enabledSensor: Bool = false {
      didSet {
              enableProximitySensor(enabled: self.enabledSensor)
      }
  }
```

The didSet enabledSensor  execute enableProximitySensor call SensorsLib thats start (or stop) listen the proximity sensor events.
```swift
public func enableProximitySensor(enabled: Bool) {
        let operation:SensorsOperation = enabled ? .START : .STOP
        SensorsLib().sensorOperation(sensorType: .PROXIMITY_SENSOR, operation: operation) { status in
         ...
        }
    }
```
The didSet privateMode  execute switchAllPrivateLablesProgrammatically thats show/hide all labels
```swift
public func switchAllPrivateLablesProgrammatically(privacyMode: PrivacyMode) {
      let privateLabels = getSubviewsOfView(v: view)
      privateLabels.forEach {
          switch privacyMode {
          case .on: $0.setPrivate(privacyMode: .on)
          case .off: $0.setPrivate(privacyMode: .off)
          }
      }
  }
```
When an event is catched, the selector function is executed, and it manage automatically the action for switch hide/visible state of all labels.

Its no mandatory work with GlobileViewController, that's why the component has the function that works independent of GlobileViewController if you want control the states by another way.

# GlobileCalendar

### Config

Many options of GlobileCalendar can be configured or used its default values

```swift
var delegate: GlobileCalendarDelegate!

var minimumDate: Date!
var maximumDate: Date!
var calendarMode = CalendarMode.rangeDate
var firstDayOfWeek = FirstWeekDay.sunday
var disabledDates: [Date]?
var calendarHeaderTintColor: GlobileCalendarColorStyle = .bostonRed
var selectedColor: GlobileCalendarColorStyle = .bostonRed
var selectedLabelColor = SantanderColor.white()
var highlightedLabelColor = SantanderColor.white()
var titleText = "Select Dates"
```

### Use

Initializers:

```swift
public func initSingleMode(startDate: Date?)
public func initRangeMode(startDate: Date, endDate: Date)
public func initRangeMode()
```

In order to create this component it is needed to define the calendar object:
```swift
let calendarObject = GlobileCalendar(collectionViewLayout: UICollectionViewFlowLayout())
```

```swift
calendarObject.initRangeMode(startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date())
calendarObject.initRangeMode()
self.initSingleMode(startDate: Date()
self.initSingleMode(startDate: nil)
```

It is also provided the possibility of starting the week from Saturday or from Monday depending on the region which is being used on the device:

```swift
@objc public enum FirstWeekDay: Int {
    case monday
    case sunday
}
```
```swift
var firstDayOfWeek = FirstWeekDay.sunday
```

SingleDate calendar or range calendar can be configured too:

```swift
@objc public enum CalendarMode: Int {
    case singleDate
    case rangeDate
}
```
```swift
var calendarMode = CalendarMode.rangeDate
```

Color options are defined in the following enum:
```swift
public enum GlobileCalendarColorStyle {
    case bostonRed, accesibleSky, darksky, darkGray
}
```

### In viewcontroller

Using this componente is as simple as modal:

```swift
        let calendarObject = GlobileCalendar(collectionViewLayout: UICollectionViewFlowLayout())
        calendarObject.delegate = self
        calendarObject.minimumDate = Date()
        calendarObject.maximumDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
        calendarObject.initRangeMode(startDate: Date(), endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date())
        calendarObject.calendarHeaderTintColor = .bostonRed
        calendarObject.selectedColor = .bostonRed
        calendarObject.firstDayOfWeek = .sunday
        calendarObject.selectedLabelColor = SantanderColor.white()
        calendarObject.highlightedLabelColor = SantanderColor.gray()
        calendarObject.titleText = "Select Date Range"
```

It's also possible to present it inside ContainerView:

Configure ViewController in storyboard with a ContainerView and the content for example is:
```swift
class ContainerViewController : CalendarDateRangePickerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

Then, configure the component overriding 'prepare' function with the parameters desired or use default values for every property:
```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ContainerCalendarView else {
            return
        }
        vc.calendarHeaderTintColor = .bostonRed
        vc.selectedColor = .bostonRed
        vc.firstDayOfWeek = .monday
        vc.minimumDate = Date()
        vc.maximumDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
        vc.selectedLabelColor = SantanderColor.white()
        vc.highlightedLabelColor = SantanderColor.gray()
        vc.initSingleMode(startDate: nil)
        vc.delegate = self
    }
```

### Protocol

Just implement the delegate methods:

```swift
public protocol GlobileCalendarDelegate: class {
    func didCancelPickingDateRange()
    func didPickDateRange(startDate: Date!, endDate: Date!)
    func didSelectStartDate(startDate: Date!)
    func didSelectEndDate(endDate: Date!)
}
```

## GlobileModalCalendar

### Instantiating modal calendar:
```swift
let modalCalendar = GlobileModalCalendar.instanceFromNib()
```

### Setting up modal calendar:
```swift
        if let globileCalendar = modalCalendar {
            globileCalendar.setUp(delegate: self, 
                in: self.view, 
                modalCalendar: globileCalendar,          
                mode: CalendarMode.rangeDate,
                minimunDate: Calendar.current.date(byAdding: .day, value: -5, to: Date()),
                maximumDate: Calendar.current.date(byAdding: .year, value: 2, to: Date()),
                startDate: nil,
                endDate: nil)
        }
```
Header definition with default configurations:
```swift
 public func setUp(delegate: GlobileModalCalendarDelegate, 
            in view: UIView, 
            modalCalendar: GlobileModalCalendar, 
            mode: CalendarMode = .singleDate,                 
            minimunDate:Date?, 
            maximumDate: Date?,
            startDate: Date?, 
            endDate: Date?,                 
            generalStyleColor: GlobileCalendarColorStyle = .accesibleSky, 
            firstDayOfWeek:FirstWeekDay = .monday, 
            selectedLabelColor: UIColor = .globileWhite, 
            highlightedLabelColor: UIColor = .globileDarkGrey )
```

The desired view will have to be passed as input parameter (normally a viewcontroller).

#### Input parameters:
* delegate: Delegate.
* view: desired view to embed the nib in.
* mode: Mode selected (singleDate or rangeDate).
* minimunDate: Minimum date or nil.
* maximumDate: Maximum date or nil.
* startDate: Starting date or nil.
* endDate: Ending date or nil.
* firstDayOfWeek: Starting day of the week. Monday or Sunday.

### Delegates:
```swift
public protocol GlobileModalCalendarDelegate: class {
    func selectDateRange(startDate: Date!, endDate: Date!)
    func selectDate(date:Date!)
}
```
* selectDateRange: starting date and ending date selected.
* selectDate: single date selected.

```swift
public protocol GlobileCalendarDelegate: class {
    func didCancelPickingDateRange()
    func didPickDateRange(startDate: Date!, endDate: Date!)
    func didSelectStartDate(startDate: Date!)
    func didSelectEndDate(endDate: Date!)
}
```
* didCancelPickingDateRange: Cancelled date picking.
* didPickDateRange: Range date selected.
* didSelectStartDate: Starting date selected.
* didSelectEndDate: Ending date selected.


# GlobileToggleButtonList

### Init
Declaration:
Native default init with NSCoder

Code:
```swift
let toggleButtonsList = GlobileToggleButtonList()
```
### Data object
The object to manage the toggle buttons data is defined by the following class:
```swift
public struct GlobileToggleButtonListData {
    public var title: String
    public var toggleButtonTag: String
    public var module: (Any)? = nil

    public init(title: String, toggleButtonTag: String, module: (Any)? = nil) {
        self.title = title
        self.toggleButtonTag = toggleButtonTag
        self.module = module
    }
}
```

### GlobileToggleButton
Declaration:
```swift
//Buttons array
let toggleButtons: [GlobileToggleButtonListData]
//Set buttons method
public func setToggleButtons(_ buttonsList: [GlobileToggleButtonListData]) {
```
Add toggle buttons to GlobileToggleButtonList:
```swift
let button1 = GlobileToggleButtonListData(title: "GlobileButton1", toggleButtonTag: "t1", module: GlobileToggleButtonListData(title: "title1", toggleButtonTag: "1"))
let button2 = GlobileToggleButtonListData(title: "GlobileButton2", toggleButtonTag: "t2", module: "screen2")
let button3 = GlobileToggleButtonListData(title: "GlobileButton3", toggleButtonTag: "t3")

 let toggleButtons: [GlobileToggleButtonListData] = [button1,button2]
toggleButtonsList.setToggleButtons(toggleButtons)
```

### Get selected button
Get a GlobileToggleButtonListData object selected in interface:
Declaration:
```swift
public func getSelectedToggleButton() -> GlobileToggleButtonListData?
```
Code:
```swift
toggleButtonsList.getSelectedToggleButton()
```

### Select toggle button programmatically
A button can be selected programmatically by button tag when you need set this button without user interaction:
Declaration:
```swift
public func selectButtonByTag(buttonTag: String)
```
Code:
```swift
toggleButtonsList.selectButtonByTag(buttonTag: "t1")
```

### Unselect all toggle buttons
Remove selection from list:
Declaration:
```swift
public func unselectAllButtons()
```
Code:
```swift
toggleButtonsList.unselectAllButtons()
```

## Delegate

### Protocol
```swift
public protocol ToggleButtonListDelegate: class {
    func toggleButtonSelectedChanged(selectedButton: GlobileToggleButtonListData?)
}
```
Add ToggleButtonListDelegate protocol to your view controller class and set self as delegate. Then add protocol stubs:
Code:
```swift
class ToggleButtonListViewController: GlobileViewController, ToggleButtonListDelegate {
    ...
    override func viewDidLoad() {
            super.viewDidLoad()
            toggleButtonsList.delegate = self
        }

func toggleButtonSelectedChanged(selectedButton: GlobileToggleButtonListData?) {
        print(selectedButton)
    }
    ...
}
```

# GlobileQuickActionButton

### Config
1- Set GlobileQuickActionButton as custom class at IB button. Button type have to be Custom in attributes.
2- Assing an icon to the button IBOutlet.
3- Select icon background tint from the following list: red, darksky, accesibleSky, gray, white.
4- Set "Disabled" enable/disable for get a default behaviour.

### In viewcontroller

1- Add IBOutlet or declare it programmatically.
```swift
@IBOutlet weak var quickActionButton: GlobileQuickActionButton!
```

2- Add image icon:
```swift
quickActionButton.setIcon(UIImage(named: "icon_image"))
```
Set text at IB or programmatically:
```swift
quickActionButton.setTitle("Button text", for: .normal)
```

3- The button has five styles.
```swift
public enum GlobileQuickActionButtonIconStyle {
    case red, darksky, accesibleSky, grey, white
}
```
Set style.
```swift
quickActionButton.style = .accesibleSky
```
4- Set enable/disable.
```swift
quickActionButton.isEnabled = true

```
An action can be setted with @IBAction function or adding a target:
```swift
quickActionButton.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
```

5- Add image from URL
```swift
  let url = URL(string: "https://img.icons8.com/nolan/2x/additional.png")!
  quickActionButton.setCachedIcon(url, placeholder:  UIImage(named: "BAN002")!)
```

# GlobileLoader

### Setting the component

Fist of all, calling instanceFromNib function will be necessary in order to instantiate GlobileLoader.

```swift
var loader: GlobileLoader?
loader = GlobileLoader.instanceFromNib()
```
NOTE: Addsubview action is made inside component's code. The programmer does not need to do it.

One type of loader will be able to cover all options. It will give the chance of embeding the loader nib into a desired view.


Input parameters:
* title: String : GLobileLoader's title
* subtitle: String : GlobileLoader's subtitle
* gifName: UIImage : GlobileLoader's gif

¡Deprecated version working until 1 June!
```swift
func setupLoaderNib(in view: UIView?, globileLoader: GlobileLoader?, title: String, subtitle: String, gifName: UIImage? = nil)
```
Input parameters:
* view: view to embed the nib.
* globileLoader: globileLoader instance.
* title: String : GLobileLoader's title
* subtitle: String : GlobileLoader's subtitle
* gifName: UIImage : GlobileLoader's gif

Updated version:
```swift
 public func setupLoaderNib(in view: UIView?, globileLoader: GlobileLoader?, loaderType: LoaderType, title: String? = "", subtitle: String? = "")
```
Input parameters:
* view: view to embed the nib.
* globileLoader: globileLoader instance.
* loaderType: LoaderType: Can be primary or secundary.
* title: String : GLobileLoader's title
* subtitle: String : GlobileLoader's subtitle

# GlobileToast

### Setting the component

Fist of all, calling instanceFromNib function will be necessary in order to instantiate GlobileToast.

```swift
var toast: Globiletoast?
toast = GlobileToast.instanceFromNib()
```

There´s only one method that have 2 input parameters:
- message: String :  GlobileToast´s message
- duration: TimeInterval : GlobileToast´s duration. It could be long or short

GlobileToast also has a default position at the bottom of the screen. This can be modified by changing the var bottomSpace (CGFloat)

How to use GlobileToast:

```swift
func show(message: String, duration: DurationToast = .short, in view: UIView)
```  


# GlobileActionSheet

### Setting the component

First of all, calling createActionSheet(containerView: UIView, title: String) function to create and show GlobileActionSheet in your UIViewController


```swift
createActionSheet(containerView: UIView, title: String) 
```
This method  have 2 input parameters:
- containerView: UIView :  View which goes inside GlobileActionSheet.
- title: String : GlobileActionSheet's title.

Also it exist one method to close GlobileActionSheet
```swift
 public func closeActionSheet(delay: Double = 0.5)
```
This method  have 1 input parameters:
- delay: Double :  Seconds to animate close effect by default 0.5.

# GlobileTextView

### Init

Default initializer with NSCoder for IB and CGRect in programatically mode.
```swift
var santanderTextView: GlobileTextView!
```

To configure the number of lines
```swift
passwordTextField.maxNumberOfLines = 10
```

### Properties and methods
#### TextView 
GlobileTextField is a UIView that includes a set of views with UITextView to which its properties can be modified. The default case does not have helpText.
Declaration:
```swift
@IBOutlet weak public var textView: GlobileTextView!
```
#### Placeholder
Declaration:
```swift
@IBInspectable public var placeholder: String?
```
Code:
```swift
santanderTextField.placeholder = "User name"
```

#### TextField text
Declaration:
```swift
public var text: String?
```
Code:
```swift
nameTextfield.text = "Mary"
```

#### Bottom label text
You can set the help text at bottom or get an action when the label is clicked:
Declaration:
```swift
@IBInspectable public var helpText: String?
// or
public func setBottomLabel(_ helpText: String, action: (() -> Void)? = nil)
```
Code:
```swift
nameTextView.helpText = "User name has to be place here."
nameTextView.setBottomLabel("User name has to be place here.", action: {
    print("User name")
})
```

#### Change State
Declaration:
```swift
public func changeState(_ state: GlobileFloatTextFieldState)
public enum GlobileFloatTextViewState {
    case `default`
    case error
}
```
Code:
```swift
santanderTextView.changeState(.error)
```

#### Background theme
Declaration:
```swift
public var backgroundTheme: BackgroundMode
public enum BackgroundMode {
        case sky, white
    }
```
Code:
```swift
santanderTextView.backgroundTheme = .sky
```

#### Delegate
Implements UITextViewDelegate to propagate methods.
Declaration:
```swift
// Protocol
public protocol GlobileTextViewDelegate: UITextViewDelegate {}
// Delegate variable
 public var delegate: GlobileTextViewDelegate?
```
Code:
```swift
santanderTextView.delegate = self
```

#### Hide helpText
Declaration:
```swift
public var hideHelpText: Bool = false {
       didSet {
            bottomLabel.isHidden = hideHelpText
           }
   }
```
Code:
```swift
santanderTextView.hideHelpText = true
```
# GlobileEmptyState

### Setting the component

Fist of all, calling instanceFromNib function will be necessary in order to instantiate GlobileEmptyState.

```swift
var emptyState: GlobileEmptyState?
emptyState = GlobileEmptyState.instanceFromNib()
```
NOTE: Addsubview action is made inside component's code. The programmer does not need to do it.


One type of loader will be able to cover all options. It will give the chance of embeding the loader nib into a desired view.

```swift
public func setupEmptyStateNib(in view: UIView?, 
                            globileEmptyState: GlobileEmptyState?, 
                            title: String? = "", 
                            subtitle: String? = "", 
                            buttonLabel: String? = "", 
                            delegate: EmptyStateProtocol? = nil, 
                            hiddenButton: Bool = false)
```
Input parameters:
* view: view to embed the nib.
* globileEmptyState: GlobileEmptyState instance.
* title: String : GlobileEmptyState's title. Empty by default.
* subtitle: String : GlobileEmptyState's subtitle. Empty by default.
* buttonLabel: String : GlobileEmptyState's subtitle. Empty by default.
* delegate: Delegate to use. 'nil' by default.
* hiddenButton: Bool : Show action button or not. 'False' by default

## EmptyStateProtocol Use 
This protocol will be used for adding the button its action property (onTouch)
```swift
//Protocol code
@objc public protocol EmptyStateProtocol {
    func actionOnPress()
}
```

After implementing this protocol to the GlobileViewController, function will be able to be filled:

```swift
//Example class with protocol.
public class GlobileEmptyStateViewController: GlobileViewController, EmptyStateProtocol {
    //Protocol function example
    public func actionOnPress() {
        navigationController?.popViewController(animated: false)
    }   
}
```


# GlobileAccordion

### Setting the component

The GlobileAccordion is a .xib using a UIView, therefore when using it, the programmer must enable TranslateMaskIntoConstraints instead of autolayout if he/she wants to include it through storyboard.
If the programmer wnats to use it by code, then the base constructor GlobileAccordion() must be used.

```swift
var globileAccordion: GlobileAccordion()
```

## addView method usage 
This method allows the user to include a UIView or any component that extends from a UIView.
```swift
//addView code
public func addView(view: UIView){
    self.subView = view
    stackView.addArrangedSubview(view)
    guard let subView = self.subView else { return }
        subView.isHidden = true
    
}

//addView usage
accordion1.addView(view: textView)
```

This method adds the view to the UIStackview inside the GlobileAccordion. Ony one view can be added per GlobileAccordion.


#### setTitle

This method will add text to the title label of the component

```swift
public var setTitle: String = "" {
    didSet {
        title.text = setTitle
    }
}
```

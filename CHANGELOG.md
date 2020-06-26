# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.10.1] - 2020-06-12
### Changed
- PageController: change color


## [2.10.0] - 2020-06-11
### Fix
- GlobileRadioButton: layout fixes.

### Added
- GlobileRadioButton: available new accessory sizes: M: 32px, S: 24px. 
- New RadioButtonType

### Changed
- Constructors with new parameters.


## [2.9.3] - 2020-06-5
### Fix
- GlobileModalCalendar: Minor fixes

### Changed
- GlobileToast: change the shadow
- ButtonSelector: change font, size and colors 
- PageController: change color
  
### Added
- GlobileProfilePhoto: change the way for the random color


## [2.9.2] - 2020-06-01

### Added
- New modal ComingSoon
- TertiaryButton_v2

### Changed
- GlobileModalCalendar: change buttons, font and colors

## [2.9.1] - 2020-05-25

### Added
- GlobileProfilePhoto: add random color for the background and the possibility of setting a color.

### Changed
- GlobileAccordion: change font, size and the resource of the arrow.
- GlobileActionSheet: change font, size and the color of the background.

### Fix
- GlobileActionSheet: Minor fixes

## [2.9.0] - 2020-05-14

### Added
- GlobileEmptyState: Added new component.
- GlobileAccordion: Added new component as xib
- GlobileInitialButton: Added the accesibility identifier

### Fix
- GlobileConnectionFailed: Added colors for title and subtitle.
- GlobileTextField: Delete key in the keyboard not working when charCount is set.
- GlobileLoader: Modified constraints for centering on X and Y gif when there is no title and subtitle. Also, title and subtitle colors have been modified. Resized gif size.
- GlobileFailedConnection: Title and subtitle colors have been modified.
- GlobileActionSheetController: GLOBILEARQ-1444

## [2.8.0] - 2020-04-30

### Added
- GlobileConnectionFailed: for fullScreenError, button can be hidden by developer as happens in partialError.
- GlobileList: added as input parameter Bounces. SetBounces()
- GlobileTextField: possibility of adding a char counter
- GlobileInitialButton2: new version ok GlobileInitialButton that includes the latest design specifications.
- GlobileTextView implemented by xib file as UIView.
- GlobileNavigationController with a new NavigationBar.
- CoreViewController for manage the nuew features of NavigationController.

### Fix
- GlobileConnectionFailed: Modified button showing label when reloads.
- GlobileFailedConnection: Modified image sizes for partialError and fullScreenError. 
- GlobileConnectionFailed: Modified partialError strings and reviewed style.
- GlobileFailedConnection: Reviewed fonts and colors. 
- GlobileConnectionFailed: Public to internal delegate.
- GlobileTextField: minor fixes
- GlobileInitialButton: Deprecated set text color, only one is allowed by Design team, medium grey
- GlobileLoader: Redesigned component.
- GlobileButton: Fix blurred icon.
- GlobileInitialButton2: Fix blurred icon.

## [2.7.2] - 2020-04-21
### Added
- GlobileTabs: Allow more than three tabs with scroll.
- GlobileRadioButton: Allow to change position of radiobutton from left to right
- Deprecated GlobileRadioButtonGroup constructor "GlobileRadioButtonGroup(radioButtons: [GlobileRadioButton])" in favor of "GlobileRadioButtonGroup(radioButtons: [GlobileRadioButton], position: RadioButtonPositionStack)".

### Fix
- GlobileFailedConnection: Public delegate.
- GlobileActionButton: Fixed colour of red style
- GlobileProfilePhoto: changed size of badge from 20 to 24. Changed font of labels to 'MicroTextBold'. Fixed badge colour to 'globileSantanderRed'
- GlobileModalCalendar: Close calendar when save button is tapped without ranges selected.
- GlobileModalCalendar: Load last month when maximum date < actual date.

## [2.7.1] - 2020-04-20
### Added
- GlobileInitialButton: Setup with design sizes. Added dark turquoise color. Adjusted elements paddings. Method "setImage" deprecated in favor of "setInitialButton". 
- GlobileTertiaryButton: Added dark turquoise color.
- GlobileActionSheet: ActionSheet with title and containerView where  put in the view which you want.

## [2.7.0] - 2020-04-03
### Added
- Possibility to show the GlobileToast in any position of the view.
- Possibility to hide the separator in GlobileTextView
- Possibility to set the input type to amount and amount with currency in GlobileTextView
- Possibility to hide the help text in GlobileTextView
- New design and behaviour GlobileConnectionFailedBanner and GlobileConnectionFailed

### Fix
- Fixed default 'sky' theme in GlobileTextView
- Fixed preselected issue with GlobileRadioButton where the RadioButton wouldn't draw
- Fixed issue with GlobileRadioButton where the RadioButton wouldn't draw when going back from a previous storyboard
- Fix automatic scroll GlobileCalendar

## [2.6.1] - 2020-03-24
### Fix
- Fixed some bugs

## [2.6.0] - 2020-03-23
### Added
- GlobileConnectionFailedBanner: Set using a view.
- GlobileConnectionFailed: Set using a view.
- GlobileLoader: Set using a view.
- GlobileModalCalendar: Set using a view.
- Localized strings.

### Fix
- GlobileConnectionFailedBanner: More than 2 lines.
- GlobileConnectionFailed: Minor design changes. More than 2 lines.
- GlobileLoader: Minor design changes. More than 2 lines.
- GlobileModalCalendar: Minor design changes to aling android version. More than 2 lines.
- GlobileTabBar: show titles always and fixed more button.

## [2.5.1] - 2020-03-06
### Added
- Image Cache to GlobileButton and GlobileIcon
- GlobileModalCalendar
- GlobileToast
- GlobileFailedConnectionBanner
- GlobileFailedConnection

### Fix
- GlobileUtilsLib
- Fix MicroText-Lt font

### Changed
- GlobileTextField bottom edge colour.

## [2.3.1] - 2020-02-21
### Changed
- GlobileTextField implemented by xib file as UIView.

### Added
- New design of GlobileCheckBox.
- New GlobileFailedConnection.
- New GlobileConnectionBanner.
- Method to disable a GlobileCheckBox option.
- Config integration of sensor state for PrivateLabel.
- Method to get GlobileIcons in GlobileTextField.

### Fix
- QuickActionButton: Improve tap recognizer, nil image controlled.
- GlobileTextField view bug making a new component by zero.
- Minor bugs

## [2.3.0] - 2020-02-12
### Added
- GlobileModal
- GlobileQuickActionButton 
- GlobileLoader
- In GlobileCheckbox: Added disabled state.
- SantanderFonts deprecated.
- All fonts as UIFont extension.
- Added new SantanderMicrotext fonts.

## [2.2.3] - 2020-01-24
### Fix
- DarkMode for iOS 9

## [2.2.2] - 2020-01-14
### Fix
- In GlobileFilter: ellipsis at end of long text.
- In Dropdownbutton: Dropdown image changed.

### Changed
- Renamed GlobileFilter to GlobileToggleButtonList.

## [2.2.1] - 2019-12-17
### Added
- GlobileFilter component with GlobileToggleButtons.

### Updated
- Dark mode colors.
- Colors

## [2.2.0] - 2019-12-10
### Fix
- Renamed Globile colors
- Colors as properties
- Fixes in dark mode

### Added
- In GlobileTextfield: click action methods to icon and clear images.

## [2.1.1] - 2019-12-02
### Fix
- In GlobileTextField: Restrict icon color in TextField

## [2.1.0] - 2019-11-29
### Added
- Dark mode
- GlobileTabs: method to select tab programmatically.

### Fix
- In GlobileTextField: Fixed top corners color, white space when change text programatically.
- In InitialButtons: Fixed image size problem, alignment with 2 lines.
- In GlobileCalendar: Backwards range works as Android.
- In CheckboxButton: Fixed multiline checkbox.

## [2.0.0] - 2019-11-14
### Changed
- Renamed UI Components.

### Fix
- GlobileDropdown: cell space at top.
- GlobileTextField: right image move.

## [1.4.7] - 2019-11-14
### Added
- Image getter.

### Changed
- GIF player.

## [1.4.6] - 2019-10-31
- Assets: Removed design catalog icons from library.

## [1.4.5] - 2019-10-31
- In globileCalendar: Updated component desingn to be as native iOS calendar.
- In GlobileTextField: Custom placeholder can be set from interface builder.

## [1.4.4] - 2019-10-23
- In globileCalendar: Updated component code. Added possible colors tint.
- In GlobileTextField: Fixed constraint conflicts for iOS 13.1 apps.

## [1.4.3] - 2019-10-17
- In globileCalendar: added color enumeration. Fix for globileCalendar component.

## [1.4.2] - 2019-10-16
### Updated
- In Foundations: Updated component.
- In PrivateLabel: Updated component.
- In Dropdown: Updated component.
- Added Calendar component preview.
- In OptionSelectionRadioButton: added multiline label modification.

## [1.4.1] - 2019-10-10
### Updated
- In Lists: EditableCells edit icon updated.
- In Cards: Color update.
- In Errors: Updated component.
- In Stepper: Updated component.
- In Slider: Color implementation modified.
- In Checkbox: Updated component.
- In PageController: Updated component.
- In ProfilePhoto: Colors updated.

## [1.4.0] - 2019-10-01
### Updated
- In AlertBar: Use as view from any ViewController.
- In Tabs: Updated component.
- In Option Selection: Updated Component.

## [1.3.9] - 2019-09-30
### Updated
- In TabBar: Top divisory line modified
- In AlertBar: Fonts modified.

## [1.3.8] - 2019-09-27
### Updated
- In InputTextField: Updated iOS13 issue related to rightview stackview

## [1.3.7] - 2019-09-25
### Updated
- In InputTextField: Infotipbutton has been hidden
- Placeholder font sizes have been incremented

## [1.3.6] - 2019-09-24
### Updated
- In InitialButton: Added icon tint option with determined color palette and updated documentation
- In TertiaryButton: Added button tint option with determined color palette and updated documentation
- In EndingButton: Updated documentation
- In InputTextField: Added secure entry option and and updated documentation
- In RadioButton: Design changes and and updated documentation

## [1.2.9] - 2019-08-14
### Updated
- Downgrade deployment target to iOS9
- Fix compiler errors about UIKit for iOS9

## [1.2.0] - 2019-06-26
### Updated
- Create as individual pod

## [1.1.2] - 2019-06-13
### Added
- Page Controller

### Changed
- Stepper

## [1.1.1] - 2019-05-29
### Added
- Tabs

## [1.1.0] - 2019-03-29
### Added
- This CHANGELOG
- AlertBar
- Cards
- Icon
- Lists
- Profile Photo
- Slider
- Stepper

### Changed
- README file now includes user manual
- ErrorHandling as part of UIComponents library

## [1.0.0] - 2019-02-28
### Added
- Ending Button
- Foundations
- Initial Button
- Input
- Navigation Bar
- Option Selection Button
- Option Selection Checkbox
- Option Selection Dropdown
- Option Selection Radio Button
- Page Controller
- Tertiary Button


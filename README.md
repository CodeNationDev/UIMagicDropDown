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


## Meta

Your Name – [@YourTwitter](https://twitter.com/dbader_org) – YourEmail@example.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

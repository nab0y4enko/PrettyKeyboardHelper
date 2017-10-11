# PrettyKeyboardHelper

[![Platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg?style=flat)](https://github.com/nab0y4enko/PrettyKeyboardHelper)
[![Swift 3 compatible](https://img.shields.io/badge/swift3-compatible-green.svg?style=flat)](https://github.com/nab0y4enko/PrettyKeyboardHelper)
[![Cocoapod](https://img.shields.io/cocoapods/v/PrettyKeyboardHelper.svg?branch=master?style=flat)](https://cocoapods.org/pods/PrettyKeyboardHelper)
[![Build Status](https://travis-ci.org/nab0y4enko/PrettyKeyboardHelper.svg?branch=master)](https://travis-ci.org/nab0y4enko/PrettyKeyboardHelper)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/nab0y4enko/PrettyKeyboardHelper/blob/master/LICENSE)
[![Twitter: @nab0y4enko](https://img.shields.io/badge/contact-@nab0y4enko-orange.svg?style=flat)](https://twitter.com/nab0y4enko)

A safe helper for keyboard notifications written in Swift.

<img src="https://raw.githubusercontent.com/nab0y4enko/PrettyKeyboardHelper/develop/demo 1.gif" alt="Demo" width="320" height="568"/> 
<img src="https://raw.githubusercontent.com/nab0y4enko/PrettyKeyboardHelper/develop/demo 2.gif" alt="Demo" width="320" height="568"/>

## Installation

### CocoaPods

KeyboardWrapper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PrettyKeyboardHelper'
```


## Usage

- Import module
```Swift
import PrettyKeyboardHelper
```

- Create `PrettyKeyboardHelper` instance
```Swift
private var prettyKeyboardHelper: PrettyKeyboardHelper?

override func viewDidLoad() {
    super.viewDidLoad()

    prettyKeyboardHelper = PrettyKeyboardHelper(delegate: self)
}
```

- Implement `PrettyKeyboardHelperDelegate`

> Simple example

```Swift
extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        bottomLayoutConstraint?.constant = keyboardInfo.estimatedKeyboardHeight
        
        //animating
        UIView.animate(withDuration: keyboardInfo.duration, delay: 0, options: keyboardInfo.animationOptions, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
```

> Resize bottom constraint

```Swift
extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        bottomLayoutConstraint?.updateConstant(keyboardInfo: keyboardInfo)
    }
}
```

> Resize bottom constraint with UITabBar

```Swift
extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        bottomLayoutConstraint?.updateConstant(with: keyboardInfo, bottomLayoutGuide: bottomLayoutGuide)
    }
}
```

> Change insets for UIScrollView

```Swift
extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        tableView?.updateBottomInset(with: keyboardInfo)
    }
}
```

> Change insets for UIScrollView with UITabBar

```Swift

extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        tableView?.updateBottomInset(with: keyboardInfo, bottomLayoutGuide: bottomLayoutGuide)
    }
}
```

## Requirements

- **iOS 8.0** or higher
- **Xcode 8.0 (swift 3.0)** or higher


## License

PrettyKeyboardHelper is available under the MIT license. See the LICENSE file for more info.

# PrettyKeyboardHelper
[![Twitter: @nab0y4enko](https://img.shields.io/badge/contact-@nab0y4enko-orange.svg?style=flat)](https://twitter.com/nab0y4enko)
[![Cocoapod](https://img.shields.io/cocoapods/v/PrettyKeyboardHelper.svg?style=flat)](https://cocoapods.org/pods/PrettyKeyboardHelper)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)]
(https://github.com/nab0y4enko/PrettyKeyboardHelper/blob/master/LICENSE)

A safe helper for keyboard notifications written in Swift.

<img src="https://raw.githubusercontent.com/nab0y4enko/PrettyKeyboardHelper/develop/demo.gif" alt="Demo" width="320" height="567"/>

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

Or easiest way

```Swift
extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        bottomLayoutConstraint?.updateConstant(keyboardInfo: keyboardInfo)
    }
}
```


## Requirements

- **iOS 9.0** or higher
- **Xcode 8.0 (swift 3.0)** or higher


## License

PrettyKeyboardHelper is available under the MIT license. See the LICENSE file for more info.

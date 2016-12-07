//
//  UIScrollView+PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 12/7/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation

public extension UIScrollView {
    
    /// Animated update bottom inset value
    ///
    /// - Parameters:
    ///   - keyboardInfo: Information from PrettyKeyboardHelper
    ///   - defaultBottomInset: Base inset value
    ///   - completion: Completion closure

    public final func updateBottomInset(with keyboardInfo: PrettyKeyboardInfo, defaultBottomInset: CGFloat = 0.0, bottomLayoutGuide: UILayoutSupport? = nil, completion: ((Bool) -> Swift.Void)? = nil) {
        
        var bottomInset: CGFloat
        if let bottomLayoutGuideLength = bottomLayoutGuide?.length, keyboardInfo.keyboardState == .keyboardWillShow {
            bottomInset = keyboardInfo.estimatedKeyboardHeight + defaultBottomInset - bottomLayoutGuideLength
        } else {
            bottomInset = keyboardInfo.estimatedKeyboardHeight + defaultBottomInset
        }
        
        UIView.animate(withDuration: keyboardInfo.duration, delay: 0, options: keyboardInfo.animationOptions, animations: {
            var contentInset = self.contentInset
            contentInset.bottom = bottomInset
            self.contentInset = contentInset
            
            var scrollIndicatorInsets = self.scrollIndicatorInsets
            scrollIndicatorInsets.bottom = bottomInset
            self.scrollIndicatorInsets = scrollIndicatorInsets
        }, completion: completion)
    }
}

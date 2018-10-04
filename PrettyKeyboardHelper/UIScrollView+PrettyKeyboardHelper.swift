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
        
        let bottomInset: CGFloat = {
            if let bottomLayoutGuideLength = bottomLayoutGuide?.length, keyboardInfo.keyboardState == .keyboardWillShow {
                return keyboardInfo.estimatedKeyboardHeight + defaultBottomInset - bottomLayoutGuideLength
            }

            return keyboardInfo.estimatedKeyboardHeight + defaultBottomInset
        }()
        
        UIView.animate(
            withDuration: keyboardInfo.duration,
            delay: 0,
            options: keyboardInfo.animationOptions,
            animations: { [weak self] in
                guard let strongSelf = self else {
                    return
                }

                var contentInset = strongSelf.contentInset
                contentInset.bottom = bottomInset
                strongSelf.contentInset = contentInset

                var scrollIndicatorInsets = strongSelf.scrollIndicatorInsets
                scrollIndicatorInsets.bottom = bottomInset
                strongSelf.scrollIndicatorInsets = scrollIndicatorInsets
            },
            completion: completion
        )
    }
}

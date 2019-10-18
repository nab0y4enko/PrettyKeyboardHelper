//
//  NSLayoutConstraint+PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
     final func updateConstant(with keyboardInfo: PrettyKeyboardInfo, defaultConstant: CGFloat = 0.0, safeAreaInsets: UIEdgeInsets? = nil, completion: ((Bool) -> Swift.Void)? = nil) {
        
        if let bottomSafeAreaInset = safeAreaInsets?.bottom, keyboardInfo.keyboardState == .willBeShown {
            constant = keyboardInfo.estimatedKeyboardHeight + defaultConstant - bottomSafeAreaInset
        } else {
            constant = keyboardInfo.estimatedKeyboardHeight + defaultConstant
        }
        
        guard let view = (firstItem ?? secondItem) as? UIView, let superview = view.superview else {
            completion?(false)
            return
        }
        
        UIView.animate(
            withDuration: keyboardInfo.duration,
            delay: 0,
            options: keyboardInfo.animationOptions,
            animations: {
                superview.layoutIfNeeded()
            },
            completion: completion
        )
    }
}

//
//  NSLayoutConstraint+PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutConstraint {
    
    /// Animated update constant value
    ///
    /// - Parameters:
    ///   - keyboardInfo: Information from PrettyKeyboardHelper
    ///   - defaultConstant: Base constant value
    ///   - completion: Completion closure
    public final func updateConstant(with keyboardInfo: PrettyKeyboardInfo, defaultConstant: CGFloat = 0.0, bottomLayoutGuide: UILayoutSupport? = nil, completion: ((Bool) -> Swift.Void)? = nil) {
        
        if let bottomLayoutGuideLength = bottomLayoutGuide?.length, keyboardInfo.keyboardState == .keyboardWillShow {
            constant = keyboardInfo.estimatedKeyboardHeight + defaultConstant - bottomLayoutGuideLength
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

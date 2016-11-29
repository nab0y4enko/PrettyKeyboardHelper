//
//  NSLayoutConstraint+PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    
    /// Animated update constant value
    ///
    /// - Parameters:
    ///   - keyboardInfo: Information from PrettyKeyboardHelper
    ///   - defaultConstant: Base constant value
    ///   - completion: Completion closure
    public final func updateConstant(keyboardInfo: PrettyKeyboardInfo, defaultConstant: CGFloat = 0.0, completion: ((Bool) -> Swift.Void)? = nil) {
        constant = keyboardInfo.estimatedKeyboardHeight + defaultConstant
        
        guard let view = firstItem as? UIView ?? secondItem as? UIView, let superview = view.superview else {
            if let completion = completion {
                completion(false)
            }
            return
        }
        
        UIView.animate(withDuration: keyboardInfo.duration, delay: 0, options: keyboardInfo.animationOptions, animations: {
            superview.layoutIfNeeded()
        }, completion: completion)
    }
}

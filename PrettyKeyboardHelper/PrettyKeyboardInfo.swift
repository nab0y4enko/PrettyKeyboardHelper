//
//  PrettyKeyboardInfo.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

// MARK: - PrettyKeyboardInfo
public struct PrettyKeyboardInfo {
    
    // MARK: - PrettyKeyboardState
    public enum KeyboardState {
        case willBeShown
        case willBeHidden
    }

    // MARK: - Public Properties
    public var keyboardState: KeyboardState
    public var duration: TimeInterval = 0
    public var animationCurve: Int = UIView.AnimationCurve.easeInOut.rawValue
    
    /// Start frame of the keyboard in screen coordinates.
    public var beginFrame: CGRect = CGRect()
    
    /// End frame of the keyboard in screen coordinates.
    public var endFrame: CGRect = CGRect()
    
    /// Whether the keyboard is in the current application
    public var isLocal: Bool = true

    // MARK: - Computed Properties
    public var estimatedKeyboardHeight: CGFloat {
        return keyboardState == .willBeShown ? endFrame.size.height : 0.0
    }

    public var animationOptions: UIView.AnimationOptions {
        return UIView.AnimationOptions(rawValue: UInt(animationCurve << 16))
    }

    // MARK: - Initializers
    init(keyboardState: KeyboardState, userInfo: [AnyHashable : Any]? = nil) {
        self.keyboardState = keyboardState
        
        guard let userInfo = userInfo else {
            return
        }
        
        if let beginFrameValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            beginFrame = beginFrameValue.cgRectValue
        }
        
        if let endFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            endFrame = endFrameValue.cgRectValue
        }
        
        if let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            duration = TimeInterval(durationValue)
        }
        
        if let animationCurveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber {
            animationCurve = animationCurveValue.intValue
        }
        
        if let isLocalValue = userInfo[UIResponder.keyboardIsLocalUserInfoKey] as? Bool {
            isLocal = isLocalValue
        }
    }
}

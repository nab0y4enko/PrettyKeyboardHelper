//
//  PrettyKeyboardInfo.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation

public struct PrettyKeyboardInfo {
    
    // MARK: - Public Properties
    public var keyboardState: PrettyKeyboardState
    public var duration: TimeInterval
    public var animationCurve: UIViewAnimationCurve
    
    /// Start frame of the keyboard in screen coordinates.
    public var beginFrame: CGRect
    
    /// End frame of the keyboard in screen coordinates.
    public var endFrame: CGRect
    
    /// Whether the keyboard is in the current application
    public var isLocal: Bool
    
    // MARK: - Initializers
    init(userInfo: [AnyHashable : Any]?, keyboardState: PrettyKeyboardState) {
        self.keyboardState = keyboardState
        self.beginFrame = (userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect()
        self.endFrame = (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect()
        self.duration = TimeInterval(userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 0.0)
        self.animationCurve = UIViewAnimationCurve(rawValue: userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int ?? 0) ?? .easeInOut
        self.isLocal = userInfo?[UIKeyboardIsLocalUserInfoKey] as? Bool ?? false
    }
}

extension PrettyKeyboardInfo {
    
    // MARK: - Computed Properties
    public var estimatedKeyboardHeight: CGFloat {
        return keyboardState == .keyboardWillShow ? endFrame.size.height : 0.0
    }
    
    public var animationOptions: UIViewAnimationOptions {
        switch animationCurve {
        case .easeInOut:
            return UIViewAnimationOptions.curveEaseInOut
        case .easeIn:
            return UIViewAnimationOptions.curveEaseIn
        case .easeOut:
            return UIViewAnimationOptions.curveEaseOut
        case .linear:
            return UIViewAnimationOptions.curveLinear
        }
    }
}

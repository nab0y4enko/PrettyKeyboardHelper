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
    public var duration: TimeInterval = 0
    public var animationCurve: UIViewAnimationCurve = .easeInOut
    
    /// Start frame of the keyboard in screen coordinates.
    public var beginFrame: CGRect = CGRect()
    
    /// End frame of the keyboard in screen coordinates.
    public var endFrame: CGRect = CGRect()
    
    /// Whether the keyboard is in the current application
    public var isLocal: Bool = true
    
    init(keyboardState state: PrettyKeyboardState, userInfo: [AnyHashable : Any]? = nil) {
        keyboardState = state
        
        guard let userInfo = userInfo else {
            return
        }
        
        if let beginFrameValue = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue {
            beginFrame = beginFrameValue.cgRectValue
        }
        
        if let endFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            endFrame = endFrameValue.cgRectValue
        }
        
        if let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double {
            duration = TimeInterval(durationValue)
        }
        
        if let animationCurveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int, let viewAnimationCurve = UIViewAnimationCurve(rawValue: animationCurveValue) {
            animationCurve = viewAnimationCurve
        }
        
        if #available(iOS 9.0, *) {
            if let isLocalValue = userInfo[UIKeyboardIsLocalUserInfoKey] as? Bool {
                isLocal = isLocalValue
            }
        }
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

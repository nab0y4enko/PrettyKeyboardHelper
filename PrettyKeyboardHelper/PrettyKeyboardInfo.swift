//
//  PrettyKeyboardInfo.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/29/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation

public final class PrettyKeyboardInfo {
    
    // MARK: - Public Properties
    public var keyboardState: PrettyKeyboardState
    public var duration: TimeInterval
    public var animationCurve: UIViewAnimationCurve
    public var beginFrame: CGRect
    public var endFrame: CGRect
    
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
    
    // MARK: - Initializers
    init(userInfo: [AnyHashable : Any]?, keyboardState: PrettyKeyboardState) {
        self.keyboardState = keyboardState
        self.beginFrame = (userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero
        self.endFrame = (userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? CGRect.zero
        self.duration = TimeInterval(userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double ?? 0.0)
        self.animationCurve = UIViewAnimationCurve(rawValue: userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Int ?? 0) ?? .easeInOut
    }
}

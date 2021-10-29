//
//  UIScrollView+PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 12/7/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit

public extension UIScrollView {

    final func updateBottomInset(with keyboardInfo: PrettyKeyboardInfo, defaultBottomInset: CGFloat = 0.0, safeAreaInsets: UIEdgeInsets? = nil, completion: ((Bool) -> Swift.Void)? = nil) {
        var bottomContentInset = keyboardInfo.estimatedKeyboardHeight + defaultBottomInset
            
        if let bottomSafeAreaInset = safeAreaInsets?.bottom, keyboardInfo.keyboardState == .willBeShown {
            bottomContentInset -= bottomSafeAreaInset
        }
        
        UIView.animate(
            withDuration: keyboardInfo.duration,
            delay: 0,
            options: keyboardInfo.animationOptions,
            animations: { [weak self] in
                guard let self = self else {
                    return
                }

                var contentInset = self.contentInset
                contentInset.bottom = bottomContentInset
                self.contentInset = contentInset

                var verticalScrollIndicatorInsets = self.verticalScrollIndicatorInsets
                verticalScrollIndicatorInsets.bottom = bottomContentInset
                self.verticalScrollIndicatorInsets = verticalScrollIndicatorInsets
            },
            completion: completion
        )
    }
}

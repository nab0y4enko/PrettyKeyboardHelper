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
                guard let strongSelf = self else {
                    return
                }

                var contentInset = strongSelf.contentInset
                contentInset.bottom = bottomContentInset
                strongSelf.contentInset = contentInset

                var scrollIndicatorInsets = strongSelf.scrollIndicatorInsets
                scrollIndicatorInsets.bottom = bottomContentInset
                strongSelf.scrollIndicatorInsets = scrollIndicatorInsets
            },
            completion: completion
        )
    }
}

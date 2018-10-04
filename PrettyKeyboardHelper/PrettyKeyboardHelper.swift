//
//  PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/28/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation

// MARK: - PrettyKeyboardHelper
public final class PrettyKeyboardHelper {
    
    // MARK: - Public Properties
    public weak var delegate: PrettyKeyboardHelperDelegate?
    
    // MARK: - Initializers
    public init(delegate: PrettyKeyboardHelperDelegate? = nil) {
        
        self.delegate = delegate
        registerObservers()
    }
    
    // MARK: - Deinitializer
    deinit {
        unregisterObservers()
        delegate = nil
    }
    
    // MARK: - Private Instance Methods
    private func registerObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private dynamic func keyboardWillShow(_ notification: Notification) {
        notifyDelegateFromKeyboardWillChange(PrettyKeyboardInfo(keyboardState: .keyboardWillShow, userInfo: notification.userInfo))
    }
    
    @objc private dynamic func keyboardWillHide(_ notification: Notification) {
        notifyDelegateFromKeyboardWillChange(PrettyKeyboardInfo(keyboardState: .keyboardWillHide, userInfo: notification.userInfo))
    }
    
    private func notifyDelegateFromKeyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        delegate?.keyboardWillChange(keyboardInfo)
    }
}

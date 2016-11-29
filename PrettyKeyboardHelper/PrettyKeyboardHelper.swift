//
//  PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/28/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import Foundation

public final class PrettyKeyboardHelper {
    
    // MARK: - Public Properties
    public weak var delegate: PrettyKeyboardHelperDelegate?
    
    // MARK: - Initializers
    public init() {
        registerObservers()
    }
    
    public convenience init(delegate: PrettyKeyboardHelperDelegate? = nil) {
        self.init()
        
        self.delegate = delegate
    }
    
    // MARK: - Deinitializer
    deinit {
        delegate = nil
        unregisterObservers()
    }
    
    // MARK: - Computed Properties
    private var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }
    
    // MARK: - Private Instance Methods
    private func registerObservers() {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private func unregisterObservers() {
        notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private dynamic func keyboardWillShow(_ notification: Notification) {
        notifyDelegateFromKeyboardWillChange(PrettyKeyboardInfo(userInfo: notification.userInfo, keyboardState: .keyboardWillShow))
    }
    
    private dynamic func keyboardWillHide(_ notification: Notification) {
        notifyDelegateFromKeyboardWillChange(PrettyKeyboardInfo(userInfo: notification.userInfo, keyboardState: .keyboardWillHide))
    }
    
    private func notifyDelegateFromKeyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        guard UIApplication.shared.applicationState != .background else {
            return
        }
        
        delegate?.keyboardWillChange(keyboardInfo)
    }
}

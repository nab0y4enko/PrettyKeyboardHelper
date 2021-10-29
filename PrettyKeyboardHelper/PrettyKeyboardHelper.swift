//
//  PrettyKeyboardHelper.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 11/28/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit
import PrettyUtils

// MARK: - PrettyKeyboardHelper
public final class PrettyKeyboardHelper {
    
    // MARK: - Singletone Implementation
    public static var shared = PrettyKeyboardHelper()
    
    // MARK: - Public Properties
    @available(*, deprecated, message: "Use addObserver(_:) and removeObserver(_:) instead")
    public private(set) weak var delegate: PrettyKeyboardHelperDelegate?
    
    // MARK: - Private Properties
    private var delegates = PrettyMulticastDelegate<PrettyKeyboardHelperDelegate>()
    
    // MARK: - Initializers
    init() {
        registerObservers()
    }
    
    @available(*, deprecated, message: "Use shared instance instead")
    public init(delegate: PrettyKeyboardHelperDelegate? = nil) {
        self.delegate = delegate
        registerObservers()
    }
    
    // MARK: - Deinitializer
    deinit {
        unregisterObservers()
        delegate = nil
    }
    
    // MARK: - Public Methods
    public func addObserver(_ delegate: PrettyKeyboardHelperDelegate) {
        delegates.add(delegate)
    }
    
    public func removeObserver(_ delegate: PrettyKeyboardHelperDelegate) {
        delegates.remove(delegate)
    }
    
    // MARK: - Private Methods
    private func registerObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        notifyDelegateFromKeyboardWillChange(PrettyKeyboardInfo(keyboardState: .willBeShown, userInfo: notification.userInfo))
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        notifyDelegateFromKeyboardWillChange(PrettyKeyboardInfo(keyboardState: .willBeHidden, userInfo: notification.userInfo))
    }
    
    private func notifyDelegateFromKeyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        delegate?.keyboardWillChange(keyboardInfo)
        
        delegates.invoke {
            $0.keyboardWillChange(keyboardInfo)
        }
    }
}

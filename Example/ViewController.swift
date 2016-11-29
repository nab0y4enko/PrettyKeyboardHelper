//
//  ViewController.swift
//  Example
//
//  Created by Oleksii Naboichenko on 11/28/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit
import PrettyKeyboardHelper

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint?
    
    // MARK: - Private Properties
    private var prettyKeyboardHelper: PrettyKeyboardHelper?
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prettyKeyboardHelper = PrettyKeyboardHelper(delegate: self)
    }
    
    // MARK: - UIResponder
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}

// MARK: - PrettyKeyboardHelperDelegate
extension ViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        bottomLayoutConstraint?.updateConstant(keyboardInfo: keyboardInfo)
    }
}


//
//  ExampleFromConstraintViewController.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 12/6/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit
import PrettyKeyboardHelper

class ExampleFromConstraintViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var bottomLayoutConstraint: NSLayoutConstraint?
    // MARK: - Private Properties
    
    private var prettyKeyboardHelper: PrettyKeyboardHelper?
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prettyKeyboardHelper = PrettyKeyboardHelper(delegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let t = bottomLayoutGuide
        print(t)
    }
}

// MARK: - UITableViewDataSource
extension ExampleFromConstraintViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCellIdentifier", for: indexPath)
        cell.textLabel?.text = "PrettyKeyboardHelper" + " " + String(indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ExampleFromConstraintViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        view.endEditing(true)
    }
}

// MARK: - PrettyKeyboardHelperDelegate
extension ExampleFromConstraintViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        bottomLayoutConstraint?.updateConstant(with: keyboardInfo, bottomLayoutGuide: bottomLayoutGuide)
    }
}

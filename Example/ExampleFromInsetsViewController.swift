//
//  ExampleFromInsetsViewController.swift
//  PrettyKeyboardHelper
//
//  Created by Oleksii Naboichenko on 12/6/16.
//  Copyright © 2016 Oleksii Naboichenko. All rights reserved.
//

import UIKit
import PrettyKeyboardHelper

// MARK: - ExampleFromInsetsViewController
class ExampleFromInsetsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        PrettyKeyboardHelper.shared.addObserver(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        PrettyKeyboardHelper.shared.removeObserver(self)
    }
}

// MARK: - ExampleFromInsetsViewController + UITableViewDataSource
extension ExampleFromInsetsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCellIdentifier", for: indexPath)
        cell.textLabel?.text = "PrettyKeyboardHelper" + " " + String(indexPath.row)
        return cell
    }
}

// MARK: - ExampleFromInsetsViewController + UITableViewDelegate
extension ExampleFromInsetsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        view.endEditing(true)
    }
}

// MARK: - ExampleFromInsetsViewController + PrettyKeyboardHelperDelegate
extension ExampleFromInsetsViewController: PrettyKeyboardHelperDelegate {
    
    func keyboardWillChange(_ keyboardInfo: PrettyKeyboardInfo) {
        tableView?.updateBottomInset(with: keyboardInfo, safeAreaInsets: view.safeAreaInsets)
    }
}

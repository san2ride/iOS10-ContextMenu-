//
//  ViewController.swift
//  iOS10 cutcopypaste
//
//  Created by don't touch me on 1/15/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

var pasteBoard = UIPasteboard.general
var tableData: [String] = ["dog", "cat", "fish"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        
        return cell
    }
    // method must return true to display the Context Menu when a Table View Cell is long-pressed.
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        
        return true
        
    }
    // method only the copy item is displayed.
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        
        if (action == #selector(UIResponderStandardEditActions.copy(_:))) {
            
            return true
        }
        return false
    }
    // method copies the selected text into the pasteBoard.
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        pasteBoard.string = cell!.textLabel?.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return false
    }
    

}


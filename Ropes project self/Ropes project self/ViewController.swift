//
//  ViewController.swift
//  Ropes project self
//
//  Created by Maxime Khuat Duy on 1/5/20.
//  Copyright © 2020 Maxime Khuat Duy. All rights reserved.
//


/*
 TODO:
 

 
 */



import Cocoa


var needToRemove = false


class ViewController: NSViewController {

    
    

    
    // OUTLETS  //
    
    @IBOutlet weak var studentPopUpButton: NSPopUpButton! /* add names to list  */
    
    @IBOutlet weak var studentNameTextField: NSTextField!
    
    @IBOutlet weak var genderPopUpButton: NSPopUpButton! /* show/hide for check box */
    
    @IBOutlet weak var genderCheckBox: NSButton! /* check wether on or off */
    
    @IBOutlet weak var numberOfStudentsLabel: NSTextField! /* tell number of students in list */
    
    @IBOutlet weak var studentBrowser: NSBrowser!
    
    
    
    
    
    // METHODS //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if studentPopUpButton != nil {
            studentPopUpButton.removeAllItems()
        
            genderPopUpButton.isHidden = true
            numberOfStudentsLabel.stringValue = "0 students in list"
            genderCheckBox.state = .off
        }
        
        
    // end of viewDidLoad method
    }

    
    
    // ACTIONS //
    
    // add student action method. Connected to button
    @IBAction func addStudent(_ sender: Any) {
        
        
        if studentNameTextField.stringValue != "" {
            
            
            // what is added to the list of student name (name + gender)
            if genderCheckBox.state == .on {
                studentPopUpButton.addItem(withTitle: studentNameTextField.accessibilityValue()! + " " +
                                                      String(genderPopUpButton.titleOfSelectedItem!))
                
            } else {
                studentPopUpButton.addItem(withTitle: studentNameTextField.accessibilityValue()!)
            }
            
            // add to studentBrowser
            //studentBrowser.cellPrototype.
        }
        
        // update studentLabel value
        numberOfStudentsLabel.stringValue = String(studentPopUpButton.numberOfItems) + " students in list"
        
        
        // organize alphabetically
        //studentPopUpButton.
        
        
        // empty text field after name was added
        studentNameTextField.stringValue = ""
        
    }
    
    
    // Gender seperation checkbox-thingy action method
    @IBAction func genderSeperationCheckbox(_ sender: Any) {
        // gender pop up shows if checked
        if genderCheckBox.state == .on {
            genderPopUpButton.isHidden = false
        } else {
            genderPopUpButton.isHidden = true
        }
        

    }
    
    
    // textfield action method
    @IBAction func textField(_ sender: NSTextField) {
        // enter key
        if studentNameTextField.stringValue != "" {
            
            
            var gender = ""
            if genderCheckBox.state == .on {
                gender = String(genderPopUpButton.titleOfSelectedItem!)
            }
            
            
            
            // add text field + gender
            studentPopUpButton.addItem(withTitle: String(studentNameTextField.accessibilityValue()!) + " " + gender)
            
            // update numberOfStudents label and empty text field
            numberOfStudentsLabel.stringValue = String(studentPopUpButton.numberOfItems) + " students in list"
            studentNameTextField.stringValue = ""

        }
    }
    
    
    @IBAction func removeAll(_ sender: Any) {
        
        if studentPopUpButton != nil {
            studentPopUpButton.removeAllItems()
        }
        
    }
    
    

    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }
    
    



// end of ViewController class
}



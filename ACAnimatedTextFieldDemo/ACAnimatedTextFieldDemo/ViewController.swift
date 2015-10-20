//
//  ViewController.swift
//  ACAnimatedTextFieldDemo
//
//  Created by Alex Catchpole on 20/10/2015.
//  Copyright © 2015 AlexCatchpole. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var demoTextField: ACAnimatedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //demoTextField.textFieldImageView.image = UIImage(named: "locked")
        demoTextField.layer.cornerRadius = 18
        demoTextField.tintColor = self.view.backgroundColor
        demoTextField.textColor = self.view.backgroundColor
        demoTextField.delegate = self
        
        
        demoTextField.activeColour = UIColor.redColor()
        demoTextField.inactiveColour = UIColor.greenColor()
        demoTextField.textFieldImage = UIImage(named: "locked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }


}


//
//  ACAnimatedTextField.swift
//  RA4WVPN
//
//  Created by Alex Catchpole on 19/10/2015.
//  Copyright © 2015 Alex Catchpole. All rights reserved.
//

import UIKit

class ACAnimatedTextField: UITextField {
    
    //Global reference to the uiimageview
    private var textFieldImageView: UIImageView!
    @IBInspectable var textFieldImage: UIImage? {
        
        didSet {
            textFieldImageView.image = textFieldImage!
        }
        
    }
    @IBInspectable var activeColour: UIColor?
    @IBInspectable var inactiveColour: UIColor?
    
    //called after init, when the rect of the textfield is being drawing
    override func drawRect(rect: CGRect) {
        
        //Default corner radius
        self.borderStyle = UITextBorderStyle.None
        self.textAlignment = NSTextAlignment.Center
        
        //add uiimageview which was initialized in init?()
        self.addSubview(textFieldImageView)
        
        //set image rendering mode so we can change colour of vector
        if textFieldImageView.image != nil {
            textFieldImageView.image = textFieldImageView.image!.imageWithRenderingMode(.AlwaysTemplate)
        }else {
            print("ACAnimatedTextField -- Image Not Set")
        }
        
        //initial colour
        if inactiveColour != nil {
            textFieldImageView.tintColor = inactiveColour
        }else {
            textFieldImageView.tintColor = UIColor(red: 205 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1)
        }
        
        //set the center of the uiimageview to self
        textFieldImageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
        
        //Remove placeholder text because the placeholder is an image
        self.placeholder = ""
        
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        
        return CGRectInset(bounds, 50, 0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 50, 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //set the frame of the uiimageview
        textFieldImageView = UIImageView(frame: CGRectMake(0, 0, 24, 24))
        
        //I didn't want to interfere with delegates so the user can use the built in delegates so I'll use targets instead
        self.addTarget(self, action: "didBeginEditing", forControlEvents: UIControlEvents.EditingDidBegin)
        self.addTarget(self, action: "didEndEditing", forControlEvents: UIControlEvents.EditingDidEnd)
    }
    
    func didBeginEditing() {
        //on edit run animation
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.textFieldImageView.center = CGPointMake(30, self.bounds.size.height / 2)
            if self.activeColour != nil {
                //make sure active colour is set
                self.textFieldImageView.tintColor = self.activeColour
            }else {
                self.textFieldImageView.tintColor = UIColor(red: 50 / 255, green: 50 / 255, blue: 50 / 255, alpha: 1)
            }
            }) { (success: Bool) -> Void in
        }
    }
    
    func didEndEditing() {
        //remove whitespace
        self.text = self.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if !self.text!.isEmpty {
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                if self.inactiveColour != nil {
                    self.textFieldImageView.tintColor = self.inactiveColour
                }else {
                    self.textFieldImageView.tintColor = UIColor(red: 205 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1)
                }
                
            }) { (success: Bool) -> Void in
                //done
                
            }
        }else {
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.textFieldImageView.center = CGPointMake(self.bounds.width / 2, self.bounds.size.height / 2);
                if self.inactiveColour != nil {
                    self.textFieldImageView.tintColor = self.inactiveColour
                }else {
                    self.textFieldImageView.tintColor = UIColor(red: 205 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1)
                }
                }) { (success: Bool) -> Void in
                    //done
            }
        }
    }
}

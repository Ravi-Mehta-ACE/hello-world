//
//  ViewController.swift
//  HelloWorld
//
//  Created by Puneet Rao on 19/05/16.
//  Copyright © 2016 Geeks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var templateTextView: UITextView!

    
    @IBAction func createStoryClicked(sender: AnyObject)
    {
        
    }
    
    @IBAction func hideKeyboard(sender: AnyObject)
    {
        placeTextField.resignFirstResponder()
        verbTextField.resignFirstResponder()
        numberTextField.resignFirstResponder()
        templateTextView.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  DecView.swift
//  f
//
//  Created by JonathanMarch on 12/8/15.
//  Copyright © 2015 JonathanMarch. All rights reserved.
//

import UIKit

class DecView: UIViewController
{
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var password: UITextField!
    
    var enc : Enc = Enc()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(enc.enc != "")
        {
            if(enc.pass != "")
            {
                textView.text = enc.enc
                password.text = enc.pass
            }
        }
    }
    
    @IBAction func DecryptPressed(sender: AnyObject)
    {
        if(textView.text != nil && textView.text != "")
        {
            if(password.text != nil && password.text != "")
            {
                if let x = Double(password.text!)
                {
                enc.enc = textView.text!
                enc.pass = "\(x)"
                enc.decode()
                performSegueWithIdentifier("show", sender: self)
                resignFirstResponder()
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "show")
        {
            let dest = segue.destinationViewController as! EncView
            dest.enc = enc
        }
    }
}

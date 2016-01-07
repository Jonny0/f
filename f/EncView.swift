//
//  EncView.swift
//  f
//
//  Created by JonathanMarch on 12/8/15.
//  Copyright © 2015 JonathanMarch. All rights reserved.
//

import UIKit

class EncView: UIViewController
{
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var textField: UITextField!
    
    var enc : Enc = Enc()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if(enc.ori != "")
        {
           textView.text = enc.ori
        }
        if(enc.pass != "")
        {
            textField.text = "Level of Encryption \(enc.pass.characters.count)"
            slider.value = Float(enc.pass.characters.count)
        }
    }
    
    @IBAction func valueChanged(sender: AnyObject)
    {
        textField.text = "Level of Encryption \(Int(slider.value))"
    }
    
    @IBAction func EncryptPressed(sender: AnyObject)
    {
        if(textView.text != nil&&textView.text != "")
        {
            enc.ori = textView.text
            enc.encrypt(Int(slider.value))
            performSegueWithIdentifier("show", sender: self)
            resignFirstResponder()
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if(segue.identifier == "show")
        {
            let dest = segue.destinationViewController as! DecView
            dest.enc = enc
        }

    }
}

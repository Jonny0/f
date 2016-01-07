//
//  Enc.swift
//  f
//
//  Created by JonathanMarch on 12/7/15.
//  Copyright © 2015 JonathanMarch. All rights reserved.
//

import UIKit

class Enc: NSObject
{
    var ori = ""
    var enc: String = ""
    var pass: String = ""
    
    func encrypt(num: Int)
    {
        pass = ""
        enc = ""
        var ints = [Int]()
        for uni in ori.unicodeScalars
        {
            ints.append(Int(uni.value))
        }
        
        var pas = [Int]()
        for var i = 0; i<num; i++
        {
            pas.append(Int(arc4random_uniform(10)))
        }
        
        for var n = 0; n<pas.count; n++
        {
            for var i = 0; i<ints.count; i+=n+1
            {
                ints[i] ^= pas[n]
            }
        }
        
        for i in pas
        {
            pass+=String(i)
        }
        enc = intsToString(ints)
    }
    
    func decode()
    {
        var ints = [Int]()
        for uni in enc.unicodeScalars
        {
            ints.append(Int(uni.value))
        }
        
        var pas = [Int]()
        
        var temp = ""
        for c in pass.characters
        {
            if let n = Int(String(c))
            {
                if(!String(c).isEmpty)
                {
                    temp += String(c)
                }
            }
        }
        temp.removeAtIndex(temp.characters.endIndex.predecessor())
        pass = temp
        
        for c in pass.characters
        {
            pas.append(Int(String(c))!)
        }
        
        for var n = 0; n<pas.count; n++
        {
            for var i = 0; i<ints.count; i+=n+1
            {
                ints[i] ^= pas[n]
            }
        }
        
        ori = ""
        ori = intsToString(ints)
    }
    
    func intsToString(ints: [Int]) ->String
    {
        var ret = ""
        for i in ints
        {
            ret.append(UnicodeScalar(i))
        }
        return ret
    }
    
}

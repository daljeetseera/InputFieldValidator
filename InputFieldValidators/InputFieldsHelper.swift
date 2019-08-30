//
//  InputFieldsHelper.swift
//  InputFieldValidators
//
//  Created by Daljeet Singh on 30/08/19.
//  Copyright © 2019 Daljeet Singh. All rights reserved.
//

import UIKit

class Validate {
    
    static func MobileNumber(_ text : String) throws -> Bool {
        if text.count == 0 { return false }
        
        let regex = "([+]?1+[-]?)?+([(]?+([0-9]{3})?+[)]?)?+[-]?+[0-9]{3}+[-]?+[0-9]{4}"
        _ = try NSRegularExpression(pattern: regex, options: [.caseInsensitive])
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        return test.evaluate(with: text)
    }
    
    static func Email(_ text : String) throws -> Bool {
        if text.count == 0 { return false }
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        _ = try NSRegularExpression(pattern: regex, options: [.caseInsensitive])
        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        return test.evaluate(with: text)
    }
    
    static func Length(text : String, min : Int?, max : Int?) -> Bool {
        
        let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if let minLength = min {
            if trimmedText.count < minLength { return false }
        }
        
        if let maxLength = max {
            if trimmedText.count > maxLength { return false }
        }
        
        return true
    }
    
    static func isNumeric(text : String) -> Bool {
        if text.isEmpty {
            return false
        }
        
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: text))
    }
    
    
}

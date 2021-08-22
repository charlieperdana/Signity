//
//  ModuleGroup+Helper.swift
//  Signity
//
//  Created by Andrean Lay on 13/08/21.
//

import Foundation

extension ModuleGroup {
    var name: String {
        get {
            return name_ ?? ""
        }
        set {
            name_ = newValue
        }
    }
    
    var regionName: String {
        get {
            return regionName_ ?? ""
        }
        set {
            regionName_ = newValue
        }
    }
    
    var categories: [Category] {
        get {
            if let items = categories_ {
                if let arr = items.array as? [Category] {
                    return arr
                }
            }
            
            return []
        }
        set {
            categories_ = NSOrderedSet(array: newValue)
        }
    }
}

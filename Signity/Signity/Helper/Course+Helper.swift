//
//  Course+Helper.swift
//  Signity
//
//  Created by Andrean Lay on 13/08/21.
//

import Foundation

extension Course {
    var name: String {
        get {
            return name_ ?? ""
        }
        set {
            name_ = newValue
        }
    }
    
    var completionState: Int16 {
        get {
            return completionState_
        }
        set {
            completionState_ = newValue
        }
    }
    
    var category: Category {
        get {
            return category_ ?? Category()
        }
        set {
            category_ = newValue
        }
    }
    
    var wordParts: [String] {
        get {
            return wordParts_ ?? []
        }
        set {
            wordParts_ = newValue
        }
    }
    
    var videoName: String {
        get {
            return name + " - " + self.category.moduleGroup.regionName
        }
    }
}

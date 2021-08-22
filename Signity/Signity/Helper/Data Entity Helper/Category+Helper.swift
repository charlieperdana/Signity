//
//  Category+Helper.swift
//  Signity
//
//  Created by Andrean Lay on 13/08/21.
//

import Foundation

enum CategoryType: String {
    case basic = "Kata Dasar"
    case situation = "Situasi"
}

extension Category {
    var code: String {
        get {
            return code_ ?? ""
        }
        set {
            code_ = newValue
        }
    }
    
    var name: String {
        get {
            return name_ ?? ""
        }
        set {
            name_ = newValue
        }
    }
    
    var type: String {
        get {
            return type_ ?? ""
        }
        set {
            type_ = newValue
        }
    }
    
    var level: Int16 {
        get {
            return level_
        }
        set {
            level_ = newValue
        }
    }
    
    var courses: [Course] {
        get {
            if let items = courses_ {
                if let arr = items.array as? [Course] {
                    return arr
                }
            }
            
            return []
        }
        set {
            courses_ = NSOrderedSet(array: newValue)
        }
    }
    
    var moduleGroup: ModuleGroup {
        get {
            return moduleGroup_ ?? ModuleGroup()
        }
        set {
            moduleGroup_ = newValue
        }
    }
    
    var typeEnum: CategoryType {
        CategoryType(rawValue: self.type) ?? .basic
    }
    
    var isCharacter: Bool {
        courses[0].name.count < 3
    }
    
    var courseCount: Int {
        self.courses.count
    }
    
    var completedCourses: Int {
        var completed = 0
        
        self.courses.forEach {
            if $0.completionState == 1 {
                completed += 1
            }
        }
        
        return completed
    }
}

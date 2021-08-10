//
//  Category+CoursesCount.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import Foundation

extension Category {
    var courseCount: Int {
        self.courses!.count
    }
    
    var completedCourses: Int {
        let arr = self.courses?.array as! [Course]
        
        var completed = 0
        for course in arr {
            if course.completionState == 1 {
                completed += 1
            }
        }
        
        return completed
    }
}

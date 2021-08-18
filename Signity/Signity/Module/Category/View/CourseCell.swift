//
//  CourseCell.swift
//  Signity
//
//  Created by Andrean Lay on 13/08/21.
//

import SwiftUI

struct CourseCell: View {
    var course: Course
    var isEven: Bool
    
    var isLetter: Bool {
        course.category.isCharacter
    }
    
    var width: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        
        return self.isLetter ? screenWidth / 5 - 16 : 50
    }
    
    var height: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        
        return self.isLetter ? screenWidth / 5 - 16 : 44
    }
    
    var bgColor: Color {
        if course.category.typeEnum == .basic || isEven {
            return Color("CourseButton")
        } else {
            return Color("LightPurple")
        }
    }
    var textColor: SignityTextColor {
        bgColor == Color("CourseButton") ? .white : .darkPurple
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 13)
                .frame(height: height)
                .foregroundColor(bgColor)
            
            if self.isLetter {
                Text(course.name)
                    .modifier(SignityLargeTitle(color: .white))
            } else {
                Text(course.name)
                    .modifier(SignityHeadlineThin(color: textColor))
            }
            
        
            
            HStack(alignment: .bottom){
                if course.completionState == 1 {
                    if course.category.typeEnum == .basic{
                        Image("checkedBtn")
                            .frame(width: 55, height: 50, alignment: .bottomTrailing)

                    }else{
                        Image("checkedBtn")
                            .frame(width: 320, height: 20, alignment: .bottomTrailing)
                    }
                    
                }
                
            }
            
            
                
        }
    }
}

struct CourseCell_Previews: PreviewProvider {
    static var previews: some View {
        CourseCell(course: Course(), isEven: false)
    }
}

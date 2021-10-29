//
//  CardViewCourse.swift
//  Signity
//
//  Created by charlie siagian on 06/08/21.
//

import SwiftUI

struct CardViewCourse: View {
    @State var showCategory = false
    
    var category: Category
    var proficiency: Int
    
    var categoryLocked: Bool {
        category.level > proficiency
    }
    
    var categoryCompleted: Bool {
        category.completedCourses == category.courseCount
    }
    
    var categoryIcon: String {
        var name = "\(category.code) - \(category.name)"
        if categoryLocked {
            name += " Locked"
        } else if categoryCompleted {
            name += " Complete"
        }
        
        return name
    }
    
    var foregroundColor: SignityTextColor {
        categoryLocked ? .gray3 : .white
    }
    
    var progressCount: SignityTextColor {
        categoryCompleted ? .mainYellow : .white
    }
    
    var backgroundColor: Color {
        categoryLocked ? Color("Gray1") : Color("CourseCategory")
    }

    var body: some View {
        NavigationLink(
            destination: CategoryView(category: category)) {
            
            HStack {
                Image(categoryIcon)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(category.type)
                            .padding(.bottom, 5)
                        Spacer()
                        if categoryLocked {
                            Image(systemName: "lock.fill")
                        } else {
                            Text("\(category.completedCourses)/\(category.courseCount)")
                                .modifier(SignitySubhead(color: progressCount))
                        }
                    }
                    .modifier(SignitySubhead(color: foregroundColor))
                    
                    Text(category.name)
                        .modifier(SignityHeadline(color: foregroundColor))
                    
                    ProgressBarCourse(value: Double(category.completedCourses), maxValue: Double(category.courseCount), locked: categoryLocked, completed: categoryCompleted)
                }
                .padding()
            }
            .frame(height: 100.0)
            .background(backgroundColor)
            .cornerRadius(13)
        }
        .disabled(self.categoryLocked)
    }
}

struct CardViewCourse_Previews: PreviewProvider {
    static var previews: some View {
        CardViewCourse(category: Category(), proficiency: 0)
            .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .previewLayout(.fixed(width: 400, height: 100))
            .cornerRadius(13)
    }
}

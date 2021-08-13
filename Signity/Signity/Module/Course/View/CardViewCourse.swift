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
    
    var categoryIcon: String {
        var name = "\(category.code) - \(category.name)"
        if categoryLocked {
            name += " Locked"
        }
        
        return name
    }
    
    var body: some View {
        NavigationLink(
            destination: CategoryView(category: category), isActive: $showCategory) {
            
            HStack {
                Image(categoryIcon)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(category.type)
                            .padding(.bottom, 5)
                        Spacer()
                        Text("\(category.completedCourses)/\(category.courseCount)")
                            .padding(.trailing, 20)
                    }
                    .modifier(SignitySubhead(color: .white))
                    
                    Text(category.name)
                        .modifier(SignityHeadline(color: .white))
        
                    
                    ProgressBarCourse(value: Double(category.completedCourses), maxValue: Double(category.courseCount))
                        .frame(height: 8)
                }
                .padding()
                
            }.onTapGesture {
                self.showCategory = true
            }
        }
        
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

//
//  CardViewCourse.swift
//  Signity
//
//  Created by charlie siagian on 06/08/21.
//

import SwiftUI

struct CardViewCourse: View {
    
    let item: Category
    @State var showCategory = false
    
    var body: some View {
        NavigationLink(
            destination: CategoryView(category: item), isActive: $showCategory) {
            
            HStack {
                Image("\(item.code!) - \(item.name!)")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.type!)
                            .padding(.bottom, 5)
                        Spacer()
                        Text("\(item.completedCourses)/\(item.courseCount)")
                            .padding(.trailing, 20)
                    }
                    .modifier(SignitySubhead(color: .white))
                    
                    Text(item.name!)
                        .modifier(SignityHeadline(color: .white))
        
                    
                    ProgressBarCourse(value: Double(item.completedCourses), maxValue: Double(item.courseCount))
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
        CardViewCourse(item: Category())
            .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .previewLayout(.fixed(width: 400, height: 100))
            .cornerRadius(13)
    }
}

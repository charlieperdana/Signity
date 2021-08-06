//
//  CardViewCourse.swift
//  Signity
//
//  Created by charlie siagian on 06/08/21.
//

import SwiftUI

struct CardViewCourse: View {
    
    let item: CourseItem
    
    var body: some View {
        HStack {
            Image("sample1")
                .resizable()
                .frame(width: 60.0, height: 60.0)
            VStack(alignment: .leading) {
                HStack {
                    Text(item.typeName)
                        .font(.caption)
                        .padding(.bottom,5)
                    Spacer()
                    Text("\(item.progress)/\(item.numExercise)")
                        .padding(.trailing, 20)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(Text("Meeting length"))
                        .accessibilityValue(Text("20 minutes"))
                }
                .font(.caption)
                
                
                
                
                Text("\(item.title)")
                    .font(.headline)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("20"))
    
                
                ProgressBarCourse(value: 3.0, maxValue: 10.0)
                    .frame(height: 8)
            }
            .padding()
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        }
        
    }
}

struct CardViewCourse_Previews: PreviewProvider {
    static var item = CourseSection.dataItem[0]
    static var previews: some View {
        CardViewCourse(item: item)
            .background(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
            .previewLayout(.fixed(width: 400, height: 100))
            .cornerRadius(13)
    }
}

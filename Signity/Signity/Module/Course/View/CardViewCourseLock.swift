//
//  CardViewCourseLock.swift
//  Signity
//
//  Created by charlie siagian on 09/08/21.
//

import SwiftUI

struct CardViewCourseLock: View {
    let item: CourseItem
    @State var showCategory = false
    
    var body: some View {
        NavigationLink(
            destination: OnboardingRegion(), isActive: $showCategory) {
            HStack {
                Image("\(item.imageDisable)")
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.typeName)
                            .font(.caption)
                            .foregroundColor(Color(#colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1)))
                            .padding(.bottom,5)
                        Spacer()
                        Image("lock")
                            .resizable()
                            .scaledToFit()
//                        Text("\(item.progress)/\(item.numExercise)")
//                            .padding(.trailing, 20)
//                            .accessibilityElement(children: .ignore)
//                            .accessibilityLabel(Text("Meeting length"))
//                            .accessibilityValue(Text("20 minutes"))
                    }
                    .font(.caption)
                    
                    
                    
                    
                    Text("\(item.title)")
                        .font(.headline)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(Text("Attendees"))
                        .accessibilityValue(Text("20"))
                        .foregroundColor(Color(#colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1)))
        
                    
                    ProgressBarCourse(value: Double(item.progress), maxValue: Double(item.numExercise), backgroundColor: Color(#colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1)))
                        .frame(height: 8)
                }
                .padding()
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                
            }.onTapGesture {
                self.showCategory = true
            }
        }
        
    }
}

struct CardViewCourseLock_Previews: PreviewProvider {
    static var item = CourseSection.dataItem[0]
    static var previews: some View {
        CardViewCourseLock(item: item)
            .background(Color(#colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)))
            .previewLayout(.fixed(width: 400, height: 100))
            .cornerRadius(13)
    }
}

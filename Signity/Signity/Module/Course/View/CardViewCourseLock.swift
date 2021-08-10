//
//  CardViewCourseLock.swift
//  Signity
//
//  Created by charlie siagian on 09/08/21.
//

import SwiftUI

struct CardViewCourseLock: View {
    let item: Category
    @State var showCategory = false
    
    var body: some View {
//        NavigationLink(
//            //            destination: CategoryView(title: item.name!, courses: Array(item.courses as! Set<Course>)), isActive: $showCategory) {
//            destination: CategoryView(category: item), isActive: $showCategory) {
        HStack {
            Image("\(item.name!)Grey")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name!)
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
                
                
                
                
                Text("\(item.name!)")
                    .font(.headline)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("20"))
                    .foregroundColor(Color(#colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1)))
                
                
                ProgressBarCourse(value: 0, maxValue: 6, backgroundColor: Color(#colorLiteral(red: 0.4078431373, green: 0.4078431373, blue: 0.4078431373, alpha: 1)))
                    .frame(height: 8)
            }
            .padding()
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            
//        }
        }
    }
}

//struct CardViewCourseLock_Previews: PreviewProvider {
//    static var item = CourseSection.dataItem[0]
//    static var previews: some View {
//        CardViewCourseLock(item: item)
//            .background(Color(#colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)))
//            .previewLayout(.fixed(width: 400, height: 100))
//            .cornerRadius(13)
//    }
//}

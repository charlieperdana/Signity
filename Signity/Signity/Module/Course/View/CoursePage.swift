//
//  CoursePage.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct CoursePage: View {
    
    let items: [CourseItem]
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading){
                Group {
                    HStack(alignment: .center){
                        Text("Pelajaran")
                            .font(.system(size: 34))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))

                        Spacer()

                        Image("settingBtn")
                    }

                }
                .padding(.horizontal)
                
                Text("BISINDO Jakarta")
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                    .padding(.leading)
                
                
                List{
                    Section(header: Text("Fundamental")) {
                        ForEach(items, id: \.title) { item in
                            CardViewCourse(item: item)
                                .listRowBackground(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                .cornerRadius(13)
                        }
                    }
                    Section(header: Text("Menyapa")) {
                        ForEach(items, id: \.title) { item in
                            CardViewCourse(item: item)
                                .listRowBackground(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                .cornerRadius(13)
                        }
                    }
                    
                }
                
                
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
    }
}

struct CoursePage_Previews: PreviewProvider {
    static var previews: some View {
        CoursePage(items: CourseSection.dataItem)
    }
}

//
//  CoursePage.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct CoursePage: View {
    
    @State var items: [CourseSection]
    
    var body: some View {
        NavigationView {
            ScrollView {
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
                        .padding([.leading, .bottom])
                        
                    
                    Spacer()
                    
                    
                    VStack(alignment:.leading){
    //                    List{
                            ForEach(items, id: \.name) { section in
                                Section(header: Text(section.name)
                                            .font(.system(size: 22))
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))) {
                                    ForEach(section.item, id: \.title) { item in
                                        CardViewCourse(item: item)
                                            .frame(height: 100.0)
                                            .listRowBackground(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                            .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                            .cornerRadius(13)
                                    }
                                }
                            }
                            
                            
    //                    }
                    }
                    .padding(.horizontal)
                    
                    
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarTitle("")
        
        
    }
}

struct CoursePage_Previews: PreviewProvider {
    static var previews: some View {
        CoursePage(items: CourseSection.data)
    }
}

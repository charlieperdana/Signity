//
//  CoursePage.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct CoursePage: View {
    @State private var showSettings = false
    
    @StateObject var viewModel = CourseViewModel()
    
    var body: some View {
//        NavigationView {
            ScrollView {
                VStack(alignment:.leading){
                    Group {
                        HStack(alignment: .center){
                            Text("Pelajaran")
                                .font(.system(size: 34))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                            
                            Spacer()
                            
                            Button(action: {
                                self.showSettings = true
                            }) {
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                            .foregroundColor(Color("MainPurple"))
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    
                    Text("BISINDO \(viewModel.currentRegion)")
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                        .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                        .padding([.leading, .bottom])
                        
                    
                    Spacer()
                    
                    
                    VStack(alignment:.leading){
                        ForEach(viewModel.currentModules) { group in
                            Section(header: Text(group.name!)
                                        .font(.system(size: 22))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))) {
                                ForEach((group.categories?.array as! [Category])) { item in
                                    if item.moduleGroup!.level > viewModel.regionProficiency {
                                        CardViewCourseLock(item: item)
                                            .frame(height: 100.0)
                                            .listRowBackground(Color(#colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)))
                                            .background(Color(#colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)))
                                            .cornerRadius(13)
                                    } else {
                                        CardViewCourse(item: item)
                                            .frame(height: 100.0)
                                            .listRowBackground(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                            .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                            .cornerRadius(13)
                                    }
                                    
                                }
                            }
                        }
    //                    }
                    }
                    .padding(.horizontal)
                    
                    
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
//        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
}

struct CoursePage_Previews: PreviewProvider {
    static var previews: some View {
        CoursePage()
    }
}

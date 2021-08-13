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
                                .modifier(SignityLargeTitle(color: .darkPurple))
                            
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
                        .modifier(SignityHeadlineThin(color: .darkPurple))
                        .padding([.leading, .bottom])
                        
                    
                    Spacer()
                    
                    
                    VStack(alignment:.leading){
                        ForEach(viewModel.currentModules) { group in
                            Section(header: Text(group.name)
                                        .modifier(SignitySubtitle(color: .darkPurple))) {
                                ForEach(group.categories) { item in
                                    CardViewCourse(category: item, proficiency: viewModel.regionProficiency)
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

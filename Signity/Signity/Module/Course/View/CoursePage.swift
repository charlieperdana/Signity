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
    
    @State var refreshID = UUID()
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
            VStack(alignment:.leading){
                Group {
                    HStack(alignment: .center){
                        Text("Pelajaran")
                            .modifier(SignityLargeTitle(color: .text))
                        
                        Spacer()
                        
                        Button(action: {
                            self.showSettings = true
                        }) {
                            Image(systemName: "gear")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        .foregroundColor(Color("Button"))
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 50)
                
                Text("BISINDO \(viewModel.currentRegion)")
                    .modifier(SignityHeadlineThin(color: .text))
                    .padding([.leading, .bottom])
                
                
                Spacer()
                
                
                VStack(alignment:.leading){
                    ForEach(viewModel.currentModules, id: \.self) { group in
                        Section(header: Text(group.name)
                                    .modifier(SignitySubtitle(color: .text))) {
                            ForEach(group.categories, id: \.self) { item in
                                CardViewCourse(category: item, proficiency: viewModel.regionProficiency)
                            }
                        }
                    }
                }
                .id(self.refreshID)
                .padding(.horizontal)
            }
        }
        
        .navigationBarHidden(true)
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        
        .onAppear {
            self.refreshID = UUID()
        }
    }
}

struct CoursePage_Previews: PreviewProvider {
    static var previews: some View {
        CoursePage()
    }
}

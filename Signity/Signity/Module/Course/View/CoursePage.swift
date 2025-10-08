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
        if viewModel.currentModules.isEmpty {
            Text("No data found. This may be caused by corrupted data in your installation. Please reinstall Signity.")
                .multilineTextAlignment(.center)
                .padding()
        } else {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                VStack(alignment:.leading){
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
            .navigationBarTitle("Pelajaran")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showSettings = true
                    }) {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .foregroundColor(Color("Button"))
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            
            .onAppear {
                self.refreshID = UUID()
            }
        }
    }
}

struct CoursePage_Previews: PreviewProvider {
    static var previews: some View {
        CoursePage()
    }
}

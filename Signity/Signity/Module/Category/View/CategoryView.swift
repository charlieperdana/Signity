//
//  CategoryView.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    var courses: [Course] {
        category.courses?.array as! [Course]
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image("backBtn")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)

            }
        }
    }
    
    let numOfColumn = 5
    
    @State var navBarHidden = false
    @State var showPracticeOnboarding = false
    var chosenWord = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                if category.typeEnum == .basic {
                    let rows = (Double(courses.count) / Double(numOfColumn)).rounded(.up)
                    
                    ForEach(0..<Int(rows)) { row in
                        HStack(spacing: 8) {
                            ForEach(0..<numOfColumn) { col in
                                let index = row * numOfColumn + col
                                
                                if index < courses.count {
                                    let currentCourse = courses[index]
                                    
                                    NavigationLink(destination: TutorialPhraseView(category: currentCourse.category!, chosenWord: currentCourse.name!), label: {
                                        CharacterCell(text: currentCourse.name!)
                                    })
                                } else {
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }
                } else {
                    VStack {
                        ForEach(courses.indices, id: \.self) { i in
                            NavigationLink(destination: TutorialPhraseView(category: courses[i].category!, chosenWord: courses[i].name!), label: {
                                PhraseCell(asker: i % 2 == 0, text: courses[i].name!)
                            })
                        }
                    }
                }
            }
            
            if category.typeEnum == .situation {
                NavigationLink(destination: OnboardingLatihanTiru(category: category, chosenWord: courses[0].name!).navigationBarHidden(true)) {
                    HStack {
                        Spacer()
                        Text("Mulai Latihan")
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                        Spacer()
                        
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                    .cornerRadius(13)
                }
            }
        }
        .navigationBarTitle(category.name!, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationBarHidden(self.navBarHidden)
        .padding()
        .onAppear {
            self.navBarHidden = false
        }
    }
}

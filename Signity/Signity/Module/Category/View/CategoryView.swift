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
        (category.courses?.array as? [Course]) ?? []
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let numOfColumn = 5
    
    @State var navBarHidden = false
    @State var showPracticeOnboarding = false
    var chosenWord = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                if category.typeEnum == .basic {
                    GridView(numOfColumn: 5, courses: courses)
                } else {
                    VStack {
                        ForEach(courses.indices, id: \.self) { i in
                            if let currentCategory = courses[i].category {
                                NavigationLink(
                                    destination: TutorialPhraseView(
                                        category: currentCategory,
                                        chosenWord: courses[i].name ?? "Not found")) {
                                        
                                    PhraseCell(asker: i % 2 == 0, text: courses[i].name ?? "Not found")
                                }
                            }
                        }
                    }
                }
            }
            
            if category.typeEnum == .situation {
                SignityButton(text: "Mulai Latihan") {
                    self.showPracticeOnboarding = true
                }
            }
            
            NavigationLink(
                destination: OnboardingLatihanTiru(category: category, chosenWord: courses[0].name ?? "Not found"),
                isActive: $showPracticeOnboarding
            ){}
        }
        .padding()
        
        .navigationBarTitle(category.name ?? "Not found", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton {
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

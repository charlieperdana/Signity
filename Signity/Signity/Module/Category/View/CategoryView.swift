//
//  CategoryView.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let numOfColumn = 5
    
    @State var navBarHidden = false
    @State var showPracticeOnboarding = false
    var chosenWord = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                if category.typeEnum == .basic {
                    GridView(numOfColumn: 5, courses: category.courses)
                } else {
                    VStack {
                        ForEach(category.courses.indices, id: \.self) { i in
                            NavigationLink(
                                destination: TutorialPhraseView(
                                    category: category,
                                    chosenWord: category.courses[i].name)) {
                                    
                                    PhraseCell(asker: i % 2 == 0, text: category.courses[i].name)
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
                destination: OnboardingLatihanTiru(category: category, chosenWord: category.courses[0].name),
                isActive: $showPracticeOnboarding
            ){}
        }
        .padding()
        
        .navigationBarTitle(category.name, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton {
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

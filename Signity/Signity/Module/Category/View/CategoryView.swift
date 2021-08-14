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
                GridView(category: category)
            }
            
            if category.typeEnum == .situation {
                SignityButton(text: "Mulai Latihan") {
                    self.navBarHidden = true
                    self.showPracticeOnboarding = true
                }
            }
            
            NavigationLink(
                destination: OnboardingLatihanTiru(category: category, chosenWord: category.courses[0].name),
                isActive: $showPracticeOnboarding
            ){}
        }
        .padding()
        
        .navigationBarHidden(self.navBarHidden)
        .navigationBarTitle(category.name, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton {
            self.presentationMode.wrappedValue.dismiss()
        })
        .onAppear {
            self.navBarHidden = false
        }
    }
}

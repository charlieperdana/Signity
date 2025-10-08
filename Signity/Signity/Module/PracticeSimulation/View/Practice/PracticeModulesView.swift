//
//  PracticeModulesView.swift
//  Signity
//
//  Created by Andrean Lay on 29/10/21.
//

import SwiftUI

struct PracticeModulesView: View {
    var category: Category
    @ObservedObject var viewModel: PracticeViewModel
    
    var body: some View {
        if self.category.typeEnum == .situation {
            SituationHorizontalModule(category: self.category, currentSelected: $viewModel.chosenCourse, currentIndex: viewModel.currentIndex, currentCorrect: viewModel.correctWord)
        } else {
            HorizontalModules(category: self.category, currentSelected: $viewModel.chosenCourse, currentIndex: viewModel.currentIndex)
        }
    }
}

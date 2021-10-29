//
//  UserGuideView.swift
//  Signity
//
//  Created by Andrean Lay on 29/10/21.
//

import SwiftUI

struct UserGuideView: View {
    @Binding var isHintVisible: Bool
    @ObservedObject var viewModel: SimulationViewModel
    
    var body: some View {
        HStack {
            YourTurnView()
            Spacer()
            HintButton() {
                self.isHintVisible = true
            }
        }
        .padding(.horizontal)
        
        SentenceFeedbackView(words: viewModel.wordTracking, currentCorrect: viewModel.correctWord)
            .padding(.bottom, 40)
    }
}

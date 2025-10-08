//
//  PracticeGuideView.swift
//  Signity
//
//  Created by Andrean Lay on 29/10/21.
//

import SwiftUI

struct PracticeGuideView: View {
    @ObservedObject var viewModel: PracticeViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            ChatBubble(text: viewModel.chosenCourse.name)
                .offset(y: -15)
            
            VideoView(videoName: viewModel.chosenCourse.videoName)
                .frame(width: 150, height: 200)
        }
        .padding()
    }
}

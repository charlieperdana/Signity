//
//  HorizontalModules.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct HorizontalModules: View {
    @ObservedObject var viewModel: PracticeViewModel
    var alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(alphabets), id: \.self) { char in
                    LetterButton(practiceDone: false, isCurrentLetter: viewModel.currentSelected == char, letter: char) {
                        viewModel.currentSelected = char
                    }
                }
            }
        }
        .padding(.bottom, 40)
    }
}

struct HorizontalModules_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalModules(viewModel: PracticeViewModel())
    }
}

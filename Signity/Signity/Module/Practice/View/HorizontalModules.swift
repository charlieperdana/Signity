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
                    PhraseButton(practiceDone: false, isSelected: viewModel.currentSelected == char, isSentence: false, phrase: String(char)) {
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

//
//  SelectionButton.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import SwiftUI

struct RegionSelectionButton: View {
    @Binding var currentRegion: String
    var regionName: String
    
    private var checkmarkImage: String {
        currentRegion == regionName ? "checkmark.circle.fill" : "circle"
    }
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Image(systemName: checkmarkImage)
                Spacer()
                Text(regionName)
                    .modifier(SignityHeadline(color: .mainPurple))
                Spacer()
            }
            .padding()
            .foregroundColor(Color("Button"))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Button"), lineWidth: 1))
        })
    }
}

struct RegionSelectionButton_Previews: PreviewProvider {
    static var previews: some View {
        RegionSelectionButton(currentRegion: .constant("Jakarta"), regionName: "Jakarta", action: {})
            .preferredColorScheme(.dark)
    }
}

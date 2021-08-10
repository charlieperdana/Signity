//
//  BackButton.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("backBtn")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

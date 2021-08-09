//
//  PhraseCell.swift
//  Signity
//
//  Created by Hanif Fauzi on 05/08/21.
//

import SwiftUI

struct PhraseACell: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 13)
                .frame(width: 358, height: 48)
                .foregroundColor(Color("MainPurple"))
            Text("Selamat Pagi")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

struct PhraseACell_Previews: PreviewProvider {
    static var previews: some View {
        PhraseACell()
    }
}

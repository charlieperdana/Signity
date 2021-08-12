//
//  PhraseCell.swift
//  Signity
//
//  Created by Hanif Fauzi on 05/08/21.
//

import SwiftUI

struct PhraseCell: View {
    var asker: Bool
    var text: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 13)
                .frame(width: 358, height: 48)
                .foregroundColor(asker ? Color("MainPurple") : Color("LightPurple"))
            Text(text)
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .foregroundColor(asker ? .white : Color("DarkPurple"))
        }
    }
}

struct PhraseACell_Previews: PreviewProvider {
    static var previews: some View {
        PhraseCell(asker: false, text: "Selamat Pagi")
    }
}

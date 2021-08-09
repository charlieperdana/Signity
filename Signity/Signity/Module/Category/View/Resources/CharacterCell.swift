//
//  BasicCharacterCel.swift
//  Signity
//
//  Created by Hanif Fauzi on 05/08/21.
//

import SwiftUI

struct CharacterCell: View {
    let width = (UIScreen.main.bounds.width)/5-16
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 13)
                .frame(width: width, height: width)
                .foregroundColor(Color("MainPurple"))
            Text("1")
                .font(.system(size: 34, design: .rounded))
                .foregroundColor(.white)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
         }
    }
}

struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell()
    }
}

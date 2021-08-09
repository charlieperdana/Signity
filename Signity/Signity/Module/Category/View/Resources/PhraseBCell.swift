//
//  PhraseTwoCell.swift
//  Signity
//
//  Created by Hanif Fauzi on 06/08/21.
//

import SwiftUI

struct PhraseBCell: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 13)
                .frame(width: 358, height: 48)
                .foregroundColor(Color("LightPurple"))
            Text("Selamat Pagi")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .foregroundColor(Color("DarkPurple"))
        }
    }
}

struct PhraseBCell_Previews: PreviewProvider {
    static var previews: some View {
        PhraseBCell()
    }
}

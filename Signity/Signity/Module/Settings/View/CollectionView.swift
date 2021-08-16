//
//  CollectionView.swift
//  Signity
//
//  Created by Devina Ranlyca on 07/08/21.
//

import SwiftUI

struct CollectionView: View {
    var communityImage : String
    var name : String
    var headline : String
    var link : String
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        HStack {
            Image(communityImage)
                .padding(.leading, 10)
                .padding(.horizontal, 10)
            VStack(alignment: .leading) {
                Text(name)
                    .modifier(SignityHeadlineThin(color: .text))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text(headline)
                    .modifier(SignityFootnote(color: .text))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            Image("chevron.right")
                .padding(.trailing,20)
        }
        .padding(.bottom, 20)
        .padding(.top, 20)
        .overlay(
            RoundedRectangle(cornerRadius: 13)
                .stroke(Color("MainPurple"), lineWidth: 1))
        .onTapGesture {
            openURL(URL(string: link)!)
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(communityImage:"LogoGerkatin",name:"GERKATIN",headline:"Platform informasi tentang keberagaman Bahasa Isyarat Indonesia.",link: "https://gerkatin.org/")
    }
}

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
    
    var body: some View {
    
            HStack {
                
                    Image(communityImage)
                    .padding(.leading,10)
                    .padding(.horizontal,10)
                
                
                
                VStack(alignment: .leading) {
                    
                    Text(name)
                        .fontWeight(.semibold)
                        .font(.system(size:17, design:.rounded))
                        .foregroundColor(Color("DarkPurple"))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text(headline)
                        .font(.system(size:13, design:.rounded))
                        .foregroundColor(Color("DarkPurple"))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                       
                        
                    
                        }
                
                Image("Nextbutton")
                    .padding(.trailing,20)

            }
            
        }
            
            }

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(communityImage:"LogoGerkatin",name:"GERKATIN",headline:"Platform informasi tentang keberagaman Bahasa Isyarat Indonesia.")
    }
}

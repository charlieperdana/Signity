//
//  CameraNavigationBar.swift
//  Signity
//
//  Created by Andrean Lay on 04/08/21.
//

import SwiftUI

struct CameraNavigationBar: View {
    var title: String
    var leftAction: () -> Void
    var rightAction: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                LinearGradient(
                    gradient: Gradient(colors: [.black, .clear]),
                    startPoint: .top,
                    endPoint: .bottom)
                    .frame(width: UIScreen.main.bounds.width, height: 95)
                Group {
                    HStack {
                        Button(action: leftAction, label: {
                            Image(systemName: "chevron.left")
                        })
                        Spacer()
                    }
                    Text(title)
                    HStack {
                        Spacer()
                        Button(action: rightAction, label: {
                            Text("Selesai")
                        })
                    }
                }
                .padding(.all)
                .padding(.top, 35)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .foregroundColor(.white)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct CameraNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CameraNavigationBar(title: "Latihan Tiru", leftAction: {}, rightAction: {})
    }
}

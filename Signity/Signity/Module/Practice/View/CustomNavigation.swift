//
//  CustomCameraNavBar.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct CustomNavigation<Content: View, Destination: View>: View {
    var navBarCollapsed: Bool
    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    let destination: Destination
    let isRoot: Bool
    let isLast: Bool
    let title: String
    let content: Content
    
    init(navBarCollapsed: Bool, destination: Destination, isRoot : Bool, isLast : Bool, title: String, @ViewBuilder content: () -> Content) {
        self.navBarCollapsed = navBarCollapsed
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                self.content
                
                if !self.navBarCollapsed {
                    VStack {
                        ZStack(alignment: .top) {
                            LinearGradient(
                                gradient: Gradient(colors: [.black, .clear]),
                                startPoint: .top,
                                endPoint: .bottom)
                                .frame(width: UIScreen.main.bounds.width, height: 95)
                            Group {
                                HStack {
                                    Button(action: {
                                        self.mode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "chevron.left")
                                    })
                                    Spacer()
                                }
                                Text(title)
                                HStack {
                                    Spacer()
                                    NavigationLink(
                                        destination: destination.navigationBarHidden(true).navigationBarHidden(true),
                                        isActive: self.$active,
                                        label: {
                                            Text("Done")
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
            
            .navigationBarHidden(true)
        }
    }
}

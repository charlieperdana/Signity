//
//  OnboardingRegion.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct OnboardingRegion: View {
    @State var check1: String = "checkEmpty"
    @State var check2: String = "checkEmpty"
    @State var check3: String = "checkEmpty"
    @State var showCourse = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("backBtn") 
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)

                }
            }
        }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("BISINDO daerah mana yang kamu gunakan?")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                Image("onboarding2")
//                    .resizable()
//                    .frame(width: 200.0, height: 200.0)
                
               
                
                VStack(alignment:.center) {
                    Button(action: {
                        self.check1 = "checked"
                        self.check2 = "checkEmpty"
                        self.check3 = "checkEmpty"
                    }) {
                        HStack {
                            Image(check1)
                            Spacer()
                            Text("Jakarta")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2))
                        
                    }
                    Button(action: {
                        self.check2 = "checked"
                        self.check1 = "checkEmpty"
                        self.check3 = "checkEmpty"
                    }) {
                        HStack {
                            Image(check2)
                            Spacer()
                            Text("Denpasar")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2))
                        
                    }
                    Button(action: {
                        self.check3 = "checked"
                        self.check2 = "checkEmpty"
                        self.check1 = "checkEmpty"
                    }) {
                        HStack {
                            Image(check3)
                            Spacer()
                            Text("Lainnya")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2))
                        
                    }
                }
                .padding(.all)
                
                VStack {
                    Button(action: {
                        print("Selesai")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showCourse = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Selesai")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                    .padding(.all)
                    
                    //MARK: - NAVIGATION LINKS
                    NavigationLink(destination: CoursePage(), isActive: $showCourse) {
                        EmptyView()
                    }
                }
                
                
            }
            .offset(y: -100)
            .padding(.all)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        
        
        
        
    
    }
}

struct OnboardingRegion_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRegion()
    }
}

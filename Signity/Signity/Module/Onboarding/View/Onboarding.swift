//
//  Onboarding.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct Onboarding: View {
    @State var showNextOnboard = false
    @State var showCourse = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Selamat Datang!")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Image("onboarding1")
//                    .resizable()
//                    .frame(width: 200.0, height: 200.0)
                
                Text("Apakah kamu pernah belajar BISINDO sebelumnya?")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(Color(hue: 0.668, saturation: 0.913, brightness: 0.726))
                    .multilineTextAlignment(.center)
                
                VStack(alignment:.leading) {
                    
                    Button(action: {
                        print("Belum")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showNextOnboard = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Belum, saya masih pemula")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.displayP3, red: 1.0, green: 0.0, blue: 0.0))
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        print("Pernah")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showCourse = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Pernah, saya mengerti BISINDO")
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
                .padding(.vertical)
                
                //MARK: - NAVIGATION LINKS
                NavigationLink(destination: OnboardingRegion(), isActive: $showNextOnboard) {
                    EmptyView()
                }
                NavigationLink(destination: CoursePage(), isActive: $showCourse) {
                    EmptyView()
                }
                
                
            }
            .offset(y: -100)
            .padding(.all)
        }
        .navigationBarHidden(true)
        
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

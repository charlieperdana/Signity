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

    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center)  {
                Spacer()
                
                Text("Selamat Datang!")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                
                
                Image("onboarding1")
                
                Text("Apakah kamu pernah belajar BISINDO sebelumnya?")
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .offset(y: 10)
                
                VStack(alignment:.leading, spacing: 15) {
                    
                    Button(action: {
                        print("Belum")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showCourse = true
                        }
                        defaults.set(true, forKey: "isBeginner")
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
                        .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                        .cornerRadius(13)
                    }
                    
                    Button(action: {
                        print("Pernah")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showNextOnboard = true
                        }
                        defaults.set(false, forKey: "isBeginner")
                    }) {
                        HStack {
                            Spacer()
                            Text("Pernah, saya mengerti BISINDO")
                                .fontWeight(.bold)
                                .font(.system(size: 17))
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1))))
                        
                    }
                }
                .padding(.vertical)
                .offset(y: 20)
                
                Spacer()
                
                //MARK: - NAVIGATION LINKS
                NavigationLink(destination: OnboardingRegion(), isActive: $showNextOnboard) {}
                NavigationLink(destination: CoursePage(), isActive: $showCourse) {
                    EmptyView()
                }
            }
            .padding(.all)
            .padding(.bottom, 150)
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        .onAppear {
            self.showCourse = UserDefaults.standard.didCompleteSetup
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

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
    
    let defaults = UserDefaults.standard
    
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
    
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
//        NavigationView {
            VStack() {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image("backBtn")
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                            
                        }
                    }
                    Spacer()
                }
                .padding(.top, 75)
                .padding(.bottom, 30)
                
                Text("BISINDO daerah mana yang kamu gunakan?")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .padding(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    
                
                Image("onboarding2")
                    .padding([.top], 20.0)
                    .padding([.bottom], 10)
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
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)), lineWidth: 1))
                        
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
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)), lineWidth: 1))
                        
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
                                .foregroundColor(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)), lineWidth: 1))
                        
                    }
                    
                }
                .padding(.bottom)
              
            
                
                VStack {
                    Button(action: {
                        print("Selesai")
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.showCourse = true
                        }
                        if (self.check1=="checked"){
                            defaults.set("Jakarta", forKey: "regionBisindo")
                        } else if (self.check2=="checked"){
                            defaults.set("Denpasar", forKey: "regionBisindo")
                        } else {
                            defaults.set("Lainnya", forKey: "regionBisindo")
                        }
                        
                        UserData.shared.firstLaunched = true
                        UserData.shared.level = 0
                        
                        viewModel.initializeCourses()
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
                        .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
                        .cornerRadius(10)
                        
                    }
                    .frame(width: 358.0, height: 44.0)
                    
                }
                .offset(y: 90)
                
                //MARK: - NAVIGATION LINKS
                NavigationLink(destination: CoursePage(items: CourseSection.data), isActive: $showCourse) {
                    EmptyView()
                }
                
                
            }
            .offset(y: -100)
            .padding(.all)
//        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .navigationBarHidden(true)
        
        
        
        
    
    }
    
//    func getOptionRegion()  {
//        if (self.check1 == "checked"){
//            defaults.set("Jakarta", forKey: "region")
//        } else if (self.check2 == "checked"){
//            defaults.set("Denpasar", forKey: "region")
//        } else {
//            defaults.set("Lainnya", forKey: "region")
//        }
//    }
}

struct OnboardingRegion_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRegion()
    }
}

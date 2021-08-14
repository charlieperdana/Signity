//
//  RootView.swift
//  Signity
//
//  Created by Andrean Lay on 13/08/21.
//

import SwiftUI

struct RootView: View {
    @StateObject var router = ViewRouter()
    
    var body: some View {
        NavigationView {
            if router.currentPage == .onboarding {
                Onboarding()
                    .environmentObject(router)
            } else {
                CoursePage()
            }
        }
        .navigationBarHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        .accentColor(Color("NavigationItem"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

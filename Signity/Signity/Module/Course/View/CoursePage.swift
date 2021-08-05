//
//  CoursePage.swift
//  Signity
//
//  Created by charlie siagian on 03/08/21.
//

import SwiftUI

struct CoursePage: View {
    var body: some View {
        NavigationView {
            Text("This is Course Page")
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CoursePage_Previews: PreviewProvider {
    static var previews: some View {
        CoursePage()
    }
}

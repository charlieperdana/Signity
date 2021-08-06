//
//  ProgressBarCourse.swift
//  Signity
//
//  Created by charlie siagian on 07/08/21.
//

import SwiftUI

struct ProgressBarCourse: View {
    
    private let value: Double
    private let maxValue: Double
    private let backgroundEnabled: Bool
    private let backgroundColor: Color
    private let foregroundColor: Color
    
    init(value: Double,
         maxValue: Double,
         backgroundEnabled: Bool = true,
         backgroundColor: Color = Color(#colorLiteral(red: 0.08235294118, green: 0.1098039216, blue: 0.4, alpha: 1)),
         foregroundColor: Color = Color.white) {
        self.value = value
        self.maxValue = maxValue
        self.backgroundEnabled = backgroundEnabled
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    private func progress(value: Double,
                          maxValue: Double,
                          width: CGFloat) -> CGFloat {
        let percentage = value / maxValue
        return width *  CGFloat(percentage)
    }
    
    var body: some View {
        ZStack{
            GeometryReader { geometryReader in
                if self.backgroundEnabled {
                    Capsule()
                        .foregroundColor(self.backgroundColor)
                }
                
                Capsule()
                    .frame(width: self.progress(value: self.value,
                                                maxValue: self.maxValue,
                                                width: geometryReader.size.width))
                    .foregroundColor(self.foregroundColor)
                    .animation(.easeIn)
                
            }
        }
    }
}

struct ProgressBarCourse_Previews: PreviewProvider {
    
    static var previews: some View {
        ProgressBarCourse(value: 3.0, maxValue: 10.0)
                    .frame(height: 10)
                    .padding(30)
    }
}

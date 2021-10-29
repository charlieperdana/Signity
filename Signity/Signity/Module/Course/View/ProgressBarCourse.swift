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
    private let locked: Bool
    private let backgroundColor: Color
    private let foregroundColor: Color
    
    init(value: Double,
         maxValue: Double,
         locked: Bool) {
        self.value = value
        self.maxValue = maxValue
        self.locked = locked
        self.backgroundColor = locked ? Color("Gray3") : Color("DarkPurple")
        self.foregroundColor = locked ? Color.clear : Color("White")
    }
    
    private func progress(value: Double,
                          maxValue: Double,
                          width: CGFloat) -> CGFloat {
        let percentage: CGFloat
        
        if value == 0 {
            percentage = .zero
        } else {
            percentage = CGFloat(value / maxValue)
        }
        
        return width * percentage
    }
    
    var body: some View {
        ZStack{
            GeometryReader { geometryReader in
                Capsule()
                    .foregroundColor(self.backgroundColor)
                
                if !self.locked {
                    Capsule()
                        .frame(width: progress(value: self.value, maxValue: self.maxValue, width: geometryReader.size.width))
                        .foregroundColor(self.foregroundColor)
                }
            }
            .frame(height: 8)
        }
    }
}

struct ProgressBarCourse_Previews: PreviewProvider {
    
    static var previews: some View {
        ProgressBarCourse(value: 3.0, maxValue: 10.0, locked: true)
            .frame(height: 10)
            .padding(30)
    }
}

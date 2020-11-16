//
//  Wave.swift
//  Shapes
//
//  Created by Maxim Macari on 16/11/20.
//

import SwiftUI

struct Wave: Shape {
    
    /*
     RECTANGLE
     
     ________________________________________
     |(.minY, .minX)    |midX               |maxX
     |                  |                   |
     |                  |                   |
     |                  |                   |
     |                  |                   |
     ----------------------------------------
     |midY              |(midX, midY)       |
     |                  |                   |
     |.                 |.    '    .        |
           '   .    '                 '   . |
     
     
     
     ----------------------------------------(maxX, maxY)
     maxY
     
     */
    
    var yOffset: CGFloat = 0.5
    
    var animatableData: CGFloat {
        set { yOffset = newValue }
        get { return yOffset }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //start
        path.move(to: CGPoint.zero)
        
        //top line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        //rihg line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        //Curve
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY),
                      control1: CGPoint(x: rect.maxX * 0.75, y: rect.maxY - (rect.midY * yOffset)),
                      control2: CGPoint(x: rect.maxX * 0.25, y: rect.maxY + (rect.midY * yOffset)))
        
        //draw las line
        path.closeSubpath()
        
        return path
    }
}

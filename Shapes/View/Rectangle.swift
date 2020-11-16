//
//  Rectangle.swift
//  Shapes
//
//  Created by Maxim Macari on 16/11/20.
//

import SwiftUI

struct Rectangle: Shape {
    
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
     |                  |                   |
     |                  |                   |
     |                  |                   |
     ----------------------------------------(maxX, maxY)
     maxY
     
     */
    
    var yOffset: CGFloat = 50
    
    var animatableData: CGFloat {
        get { return yOffset }
        set { yOffset = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        //start point
        path.move(to: CGPoint.zero) // (0, 0)
        //top line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        //right line
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - yOffset))
        //Bottom curve line
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - yOffset), control: CGPoint(x: rect.midX, y: rect.maxY + yOffset))
        
        path.closeSubpath()
        
        
        return path
    }
    
}


//
//  Trapezium.swift
//  Shapes
//
//  Created by Maxim Macari on 15/11/20.
//

import SwiftUI


struct Trapezium1: Shape {
    
    var offset: CGFloat = 0.75
    
    var corner: UIRectCorner = .bottomLeft
    
    
    var animatableData: CGFloat{ // this animates the shape
        get { return offset }
        set { offset = newValue }
    }
    
   
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        //start point - top left
        path.move(to: CGPoint(x: 0, y: corner == .topLeft ? rect.maxY * offset : 0)) //start
        //top right
        path.addLine(to: CGPoint(x: rect.width, y: corner == .topRight ? rect.maxY * offset : 0)) // rect.maxX == rect.width
        
        //bottom right
        path.addLine(to: CGPoint(x: rect.maxX, y: corner == .bottomRight ? rect.maxY * offset : rect.maxY))
        //bottom left
        path.addLine(to: CGPoint(x: 0, y: corner == .bottomLeft ? rect.maxY * offset : rect.maxY))
        
        path.closeSubpath()
        
        return path
        
    }
}


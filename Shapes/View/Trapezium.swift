//
//  Trapezium.swift
//  Shapes
//
//  Created by Maxim Macari on 15/11/20.
//

import SwiftUI

/*
 from GeometryReader
 ------------------------------------------
 |minY              midX              maxX|
 |minX               |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |         <- iPhone
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 -minY-------------------------------------
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |                   |                    |
 |maxY               |                    |
 ------------------------------------------
 
 [
    Locale coordinate space
    minX: 0    midX: 368       maxX: 736
    Global Coordinate Space
    minX: 16   midX: 384       maxX: 752
 ]
 minY: 492      midY: 750       maxY: 1008
 
 
 path: 2d object
 */

struct Trapezium: Shape {
    
    var offset: CGFloat = 0.75
    
    var animatableData: CGFloat{ // this animates the shape
        get { return offset }
        set { offset = newValue }
    }
    
   
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
//        path.move(to: .zero) // same as below
        path.move(to: CGPoint(x: 0, y: 0)) //start
        
        path.addLine(to: CGPoint(x: rect.width, y: 0)) // rect.maxX == rect.width
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY * self.offset))
        
        path.closeSubpath()
        
        return path
        
    }
}


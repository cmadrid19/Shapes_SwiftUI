//
//  Triangle.swift
//  Shapes
//
//  Created by Maxim Macari on 16/11/20.
//

import SwiftUI

struct Triangle: Shape {
    
                /*
                 ________________________________________
(.minY, .minX)   | .                |midX               |maxX
                 |     .            |                   |
                 |         .        |                   |
                 |            .     |                   |
                 |                . |                   |
                 ----------------------------------------
                 |midY              |(midX, midY)       |
                 |                  |     .             |
                 |                  |         .         |
                 |                  |             .     |
                 |                  |                 . |
                 ----------------------------------------(maxX, maxY)
                 maxY
                 
                 */
    
    var xOffset: CGFloat = 0.5
    
    var animatableData: CGFloat {
        set {xOffset = newValue}
        get {return xOffset}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX * xOffset, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.closeSubpath()
        
        return path
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        
        Triangle(xOffset: 0)
            .stroke(Color.primary, lineWidth: 1)
            .frame(height: 200)
            .padding()
        
        Triangle(xOffset: 0.5)
            .stroke(Color.primary, lineWidth: 1)
            .frame(height: 200)
            .padding()
        
        Triangle(xOffset: 1)
            .stroke(Color.primary, lineWidth: 1)
            .frame(height: 200)
            .padding()
            
            
    }
}

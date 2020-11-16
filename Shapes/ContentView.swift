//
//  ContentView.swift
//  Shapes
//
//  Created by Maxim Macari on 15/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    
    //Trapezium
    @State private var offset: CGFloat = 0.65
    @State private var change = false
    
    //Triangle
    @State private var degress: Double = 0.0
    
    
    var body: some View{
        ScrollView{
            VStack{
                ZStack{
                    
                    Trapezium1(offset: 0.5, corner: .bottomRight)
                        .fill(Color.gray.opacity(0.25))
                        .shadow(radius: 8)
                        .cornerRadius(8)
                    
                    
                    
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Trapezium(offset: change ? offset : 1))
                        .shadow(radius: 16)
                        .overlay(Trapezium(offset: change ? offset : 1).stroke(Color.gray, lineWidth: 1))
                        .cornerRadius(8)
                    
                    
                    
                }
                .edgesIgnoringSafeArea(.top)
                .padding(4)
                
                
                Text("A trapezium")
                    .font(.title)
                    .offset(x: change ? 0 : -400)
                
                
                Slider(
                    value: $offset, in: 0.00001...1
                )
                .padding(.horizontal)
                
                
                Button(action: {
                    /*
                     .linear -> Even speed form begining t oend
                     .easeIn -> Starts slow, speeds up, slows dawn on end
                     */
                    withAnimation(Animation.linear(duration: 1.2)){ // this animates only the slider, not the shape
                        self.offset = 0.75
                    }
                    
                }, label: {
                    Text("Reset")
                })
                
                Spacer()
                
                ZStack{
                    Trapezium1(offset: offset, corner: .topLeft)
                        .fill(Color.orange.opacity(0.8))
                        .shadow(radius: 8)
                    Trapezium1(offset: offset, corner: .topRight)
                        .fill(Color.orange.opacity(0.5))
                        .shadow(radius: 8)
                }
                
                
            }
            .frame(height: UIScreen.main.bounds.height)
            .onAppear(){
                withAnimation(Animation.linear(duration: 2)){ // this animates only the slider, not the shape
                    self.change.toggle()
                }
                
            }
            
            Spacer()
            
            //Rectangle
            VStack{
                
                Text("Rectangle image clipped()")
                    .font(.title2)
                    .fontWeight(.heavy)
                
                Image("image")
                    .clipShape(
                        Rectangle(yOffset: change ? 40 : -40)
                    )
                
                Button(action: {
                    withAnimation(.linear){
                        self.change.toggle()
                    }
                    
                }, label: {
                    Text("Resize")
                })
                
                
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            
            Spacer()
            
            //wave
            VStack{
                ZStack(alignment: .topLeading){
                    Wave(yOffset: change ? -1: 1.2)
                        .fill(Color.red)
                        .opacity(0.5)
                        .frame(height: 180)
                        .edgesIgnoringSafeArea(.all)
                        .shadow(radius: 8)
                    
                    Wave(yOffset: change ? -0.5 : -1)
                        .fill(Color.blue)
                        .opacity(0.5)
                        .frame(height: 180)
                        .edgesIgnoringSafeArea(.all)
                        .shadow(radius: 8)
                    
                    Wave(yOffset: change ? 0.9 : -0.9)
                        .fill(Color.green)
                        .opacity(0.2)
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.all)
                        .shadow(radius: 8)
                        .overlay(
                            Text("Wave")
                                .font(.title2)
                                .fontWeight(.bold)
                                .shadow(radius: 1)
                        )
                    
                }
                
                Button(action: {
                    withAnimation(
                        Animation.easeInOut(duration: 2)
                            .repeatForever(autoreverses: true)){
                        self.change.toggle()
                    }
                    
                }, label: {
                    Text("Change control points")
                })
                
                Spacer(minLength: 40)
            }
            
            
            Spacer()
            
            
            //Triangle
            VStack{
                Triangle()
                    .fill(Color.red)
                    .frame(height: 200)
                    .padding(5)
                    .shadow(radius: 8)
                    //flip
                    .scaleEffect(y: -1)
                    .overlay(
                        Text("Filled triangle")
                            .font(.title2)
                            .fontWeight(.heavy)
                    )
                
                
            }
            
            Spacer(minLength: 500)
            
            
            VStack{
                
                ZStack{
                    TrianglesCornerView()
                        .scaleEffect(x: -1, y: -1)
                    
                    TrianglesCornerView()
                        .scaleEffect(x: -1, y: 1)
                    
                    TrianglesCornerView()
                        .scaleEffect(x: 1, y: -1)
                    
                    TrianglesCornerView()
                        .scaleEffect(x: 1, y: 1)
                }
                
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            GeometryReader { geo in
                VStack{
                    ZStack{
                        ForEach(1 ..< 11) { index in
                            Triangle()
                                .fill(Color.red)
                                .opacity(0.4)
                                .frame(width: 150, height: 150)
                                .rotationEffect(.degrees(Double(index) * degress), anchor: .center)
                        }
                    }
                    .offset(x: change ? 200 : 0, y:change ? -50 : 0)
                    
                    
                }
                .onAppear(){
                    withAnimation(
                        Animation.easeOut(duration: 2).repeatForever(autoreverses: true)
                    ){
                        degress += 36
                    }
                }
                
                Spacer(minLength:  150)
            }
            
            
           
        }
       
    }
}

struct TrianglesCornerView: View {
    var body: some View{
        GeometryReader{ geoReader in
            ZStack(alignment: .bottomLeading){
                Triangle()
                    .fill(Color.purple)
                    .opacity(0.2)
                    .frame(height: 50)
                
                Triangle()
                    .fill(Color.purple)
                    .opacity(0.2)
                    .frame(width: geoReader.size.width - 50, height: 100)
                
                Triangle()
                    .fill(Color.purple)
                    .opacity(0.2)
                    .frame(width: geoReader.size.width - 100, height: 150)
                
                Triangle()
                    .fill(Color.purple)
                    .opacity(0.2)
                    .frame(width: geoReader.size.width - 150, height: 200)
                
                Triangle()
                    .fill(Color.purple)
                    .opacity(0.2)
                    .frame(width: geoReader.size.width - 200, height: 250)
                
            }
        }
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/2/20.
//

import SwiftUI
//bg
let red: Double = 248 / 255
let green: Double = 211 / 255
let blue: Double = 176 / 255
//brown
let red2: Double = 187 / 255
let green2: Double = 108 / 255
let blue2: Double = 80 / 255
//dak blue
let red3: Double = 124 / 255
let green3: Double = 140 / 255
let blue3: Double = 144 / 255
//light blue
let red4: Double = 170 / 255
let green4: Double = 190 / 255
let blue4: Double = 194 / 255
//purple
let red5: Double = 128 / 255
let green5: Double = 86 / 255
let blue5: Double = 183 / 255

struct ContentView: View {
    
    
    var body: some View {
        ZStack {
            Color(red: red, green: green, blue: blue)
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack {
                    HStack{
                        VStack {
                            
                            Image(systemName: "sun.max")
                                .resizable()
                                .frame(width: 90, height: 90)
                            Spacer()
                        }
                        VStack {
                            HStack {
                                Text("Today will be . . .")
                                    .foregroundColor(Color(red: red2, green: green2, blue: blue2))
                            }
                            HStack {
                                VStack{
                                    HStack {
                                        HStack {
                                            Image(systemName: "arrow.up")
                                                .resizable()
                                                .frame(width: 25.0, height: 35.0)
                                            Text("90°")
                                                .multilineTextAlignment(.leading)
                                        }
                                        .foregroundColor(Color(red: red3, green: green3, blue: blue3))

                                        Text("Mostly Sunny")
                                            .font(.custom("barcelona", size: 35))
                                            .multilineTextAlignment(.trailing)
                                    }
                                    HStack {
                                        HStack {
                                            Image(systemName: "arrow.down")
                                                .resizable()
                                                .frame(width: 25.0, height: 35.0)
                                            Text("70°")
                                                .multilineTextAlignment(.leading)
                                        }
                                        .foregroundColor(Color(red: red4, green: green4, blue: blue4))

                                        Text("Rain : 0 %")
                                            .font(.custom("barcelona", size: 35))
                                            .multilineTextAlignment(.trailing)
                                    }
                                }
                            }
                            Spacer()
                        }
                        
                    }
                    
                    .padding()
                    
                            
                }
                .font(.custom("barcelona", size: 50))
                .foregroundColor(.white)
                VStack {
                    Path{ path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: 2500, y: 0))
                            }
                            .stroke(style: StrokeStyle(lineWidth: 3, dash: [15]))
                    .foregroundColor(Color(red: red2, green: green2, blue: blue2))
                }
                .frame(height: 3)
                VStack{
                    HStack {
                        Spacer()
                        VStack{
                            Image("shirt")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .rotationEffect(.degrees(-20))
                        }
                        Spacer()
                        VStack{
                            Image("cap")
                                .resizable()
                                .frame(width: 79, height: 58)
                                .rotationEffect(.degrees(20))
                        }
                        Spacer()
                    }
                    .padding()
                    HStack {
                        Spacer()
                        VStack{
                            Image("pants")
                                .resizable()
                                .frame(width: 217/4, height: 579/4)
                                .rotationEffect(.degrees(20))
                        }
                        Spacer()
                        VStack{
                            Image("sunglasses")
                                .resizable()
                                .frame(width: 248/2, height: 143/2)
                                .rotationEffect(.degrees(-20))
                        }
                        Spacer()
                    }
                    .padding()
                    HStack {
                        Spacer()
                        VStack{
                            Image("sneakers")
                                .resizable()
                                .frame(width: 192/2, height: 102/2)
                                .rotationEffect(.degrees(-20))
                        }
                        Spacer()
                    }
                    .padding()
                    VStack {
                        Path{ path in
                                    path.move(to: CGPoint(x: 0, y: 0))
                                    path.addLine(to: CGPoint(x: 2500, y: 0))
                                }
                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [15]))
                                .foregroundColor(Color(red: red2, green: green2, blue: blue2))
                                .frame(height: 3)
                        Text("Don't forget your sunglasses!")
                            .foregroundColor(Color(red: red5, green: green5, blue: blue5))
                            .font(.custom("barcelona", size: 30))
                        Path{ path in
                                    path.move(to: CGPoint(x: 0, y: 0))
                                    path.addLine(to: CGPoint(x: 2500, y: 0))
                                }
                                
                                .stroke(style: StrokeStyle(lineWidth: 3, dash: [15]))
                                .foregroundColor(Color(red: red2, green: green2, blue: blue2))
                        .frame(height: 3)
                    }
                }
              Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDevice("iPhone 11 Pro")
        }
    }
}

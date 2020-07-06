//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/2/20.
//

import SwiftUI

struct ContentView: View {
    var clothing: [Clothing] = []
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    VStack{
                        Image(systemName: "sun.max")
                            .resizable()
                            .frame(width: 90, height: 90)
                    }
                    VStack{
                        HStack{
                            Text("Today will be . . .")
                                .foregroundColor(Color("brownTitle"))
                        }
                        HStack{
                            VStack{
                                HStack{
                                    HStack{
                                        Image(systemName: "arrow.up")
                                            .resizable()
                                            .frame(width: 25.0, height: 35.0)
                                        Text("90°")
                                            .multilineTextAlignment(.leading)
                                    }
                                    .foregroundColor(Color("maxBlue"))

                                    Text("Mostly Sunny")
                                        .font(.custom("barcelona", size: 35))
                                        .multilineTextAlignment(.trailing)
                                }
                                HStack{
                                    HStack{
                                        Image(systemName: "arrow.down")
                                            .resizable()
                                            .frame(width: 25.0, height: 35.0)
                                        Text("70°")
                                            .multilineTextAlignment(.leading)
                                    }
                                    .foregroundColor(Color("minBlue"))

                                    Text("Rain : 0 %")
                                        .font(.custom("barcelona", size: 35))
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                        }
                    }
                }
                .padding()
                .font(.custom("barcelona", size: 50))
                .foregroundColor(.white)
                Spacer()
                VStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 16)],spacing: 16) {
                        ForEach(clothing) { clothing in
                            ClothingCell(clothing: clothing)
                                .frame(maxWidth: 100)
                        }
                    }
                }
                Spacer()
                
                VStack {
                    Text("Don't forget your sunglasses!")
                        .foregroundColor(Color("purpleAccent"))
                        .font(.custom("barcelona", size: 30))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(clothing: testData
            ).previewDevice("iPad Pro")
            
            ContentView(clothing: testData
            ).previewDevice("iPhone 11 Pro")
        }
    }
}

struct ClothingCell: View {
    var clothing: Clothing
    var body: some View {
            Image(clothing.imageName)
                .resizable()
                .frame(width: 100, height: 100)
    }
}

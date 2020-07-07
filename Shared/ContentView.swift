//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/2/20.
//

import SwiftUI

struct ContentView: View {
    @State var min: Float = 0.0
    @State var max: Float = 0.0
    @State var description = ""
    
    var clothing: [Clothing] = []
    
    func getWeatherData() {
        let jsonURLString = "https://api.openweathermap.org/data/2.5/onecall?lat=38.7892&lon=-90.3226&exclude=current,minutely,hourly&units=imperial&appid=ec6de2817bcdb0f0cab7424c07dada17"
        // make URL
        guard let url = URL(string: jsonURLString) else { return }
        // create a session
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        // check for error
        if error != nil {
            print(error!.localizedDescription)
        }
        // check for 200 OK status from dataTask
        guard let data = data else { return }
        do {
            let weather = try JSONDecoder().decode(JSON.self, from: data)
            self.min = (weather.daily?[0].temp?.min) ?? 0.0
            self.max = (weather.daily?[0].temp?.max) ?? 0.0
            self.description = (weather.daily?[0].weather?[0].description) ?? ""
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
    }
    
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
                        VStack{
                            HStack{
                                HStack{
                                    Image(systemName: "arrow.up")
                                        .resizable()
                                        .frame(width: 25.0, height: 35.0)
                                    Text("\(self.max, specifier: "%.0f")")
                                        .multilineTextAlignment(.leading)
                                }
                                .foregroundColor(Color("maxBlue"))

                                Text(self.description.capitalized)
                                    .font(.custom("barcelona", size: 35))
                                    .multilineTextAlignment(.trailing)
                            }
                            HStack{
                                HStack{
                                    Image(systemName: "arrow.down")
                                        .resizable()
                                        .frame(width: 25.0, height: 35.0)
                                    Text("\(self.min, specifier: "%.0f")")
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
                        .font(.custom("barcelona", size: 40))
                }
            }
        }
        .onAppear {
            getWeatherData()
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(clothing: testData
            ).previewDevice("iPhone 11 Pro")
        }
    }
}


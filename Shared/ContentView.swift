//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 7/2/20.
//

import SwiftUI
import Keys

//using cocoapods-keys
let keys = WeatherClothesKeys()
let appid = keys.appid

struct ContentView: View {
    @State var morn: Float = 65.0
    @State var day: Float = 70.0
    @State var eve: Float = 72.0
    @State var night: Float = 68.0
    @State var description = "partly cloudy"
    @State var weatherType = "hot"
    
    var clothing: [Clothing] = []
    
    func getWeatherData() {
        let jsonURLString = "https://api.openweathermap.org/data/2.5/onecall?lat=38.7892&lon=-90.3226&exclude=current,minutely,hourly&units=imperial&appid=" + String(appid)
        
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
            self.morn = (weather.daily?[0].feels_like?.morn) ?? 0.0
            self.day = (weather.daily?[0].feels_like?.day) ?? 0.0
            self.eve = (weather.daily?[0].feels_like?.eve) ?? 0.0
            self.night = (weather.daily?[0].feels_like?.night) ?? 0.0
            self.description = (weather.daily?[0].weather?[0].description) ?? ""
            
            switch self.day {
                case 0...32: self.weatherType = "freezing"
                case 32...50: self.weatherType = "cold"
                case 50...70: self.weatherType = "fair"
                case 70...80: self.weatherType = "warm"
                case 80...: self.weatherType = "hot"
                default: self.weatherType = "n/a"
            }
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
                VStack{
                    Text("Today will be . . .")
                        .foregroundColor(Color("brownTitle"))
                    HStack{
                        Spacer()
                        VStack {
                            Image(systemName: "sunrise")
                            Text("\(self.morn, specifier: "%.0f")")
                        }
                        .foregroundColor(Color("minBlue"))
                        Spacer()
                        VStack {
                            Image(systemName: "sun.max")
                            Text("\(self.day, specifier: "%.0f")")
                        }
                        .foregroundColor(.yellow)
                        Spacer()
                        VStack {
                            Image(systemName: "sunset")
                            Text("\(self.eve, specifier: "%.0f")")
                        }
                        .foregroundColor(.orange)
                        Spacer()
                        VStack {
                            Image(systemName: "moon")
                            Text("\(self.night, specifier: "%.0f")")
                        }
                        .foregroundColor(Color("brownTitle"))
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("\(self.description.capitalized)")
                            .foregroundColor(.blue)
                        Spacer()
                        Text("\(self.weatherType.capitalized)")
                            .foregroundColor(.orange)
                        Spacer()
                    }
                    .font(.custom("sweet purple", size: 50))
                    .opacity(0.5)
                }
                .padding()
                .font(.custom("sweet purple", size: 50))
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
                        .font(.custom("sweet purple", size: 40))
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


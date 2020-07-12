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
    @State var morn: Float = 0.0
    @State var day: Float = 0.0
    @State var eve: Float = 0.0
    @State var night: Float = 0.0
    @State var description = ""
    @State var weatherType = ""
    @State var rain: CGFloat = 0.0
    @State var clouds: Int = 0
    @State var suggestion: String = ""
    @State var date: Int = 0
    
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
            self.morn = (weather.daily?[self.date].feels_like?.morn) ?? 0.0
            self.day = (weather.daily?[self.date].feels_like?.day) ?? 0.0
            self.eve = (weather.daily?[self.date].feels_like?.eve) ?? 0.0
            self.night = (weather.daily?[self.date].feels_like?.night) ?? 0.0
            self.description = (weather.daily?[self.date].weather?[0].description) ?? ""
            self.rain = (weather.daily?[self.date].rain) ?? 0.0
            self.clouds = (weather.daily?[self.date].clouds) ?? 0
            
            switch self.day {
                case 0...32: self.weatherType = "freezing"
                case 32...50: self.weatherType = "cold"
                case 50...70: self.weatherType = "fair"
                case 70...80: self.weatherType = "warm"
                case 80...: self.weatherType = "hot"
                default: self.weatherType = "n/a"
            }
            
            switch self.clouds {
                case 0...50: self.suggestion = "Don't forget your sunglasses!"
                case 50...100: self.suggestion = "Cloudy today..."
                default: self.suggestion = ""
            }
            
            switch self.rain {
                case 1...: self.suggestion += "\nBring an umbrella, too."
                default: return
            }
            
        } catch let err {
            print ("Json Err", err)
        }
        // start the session
        }.resume()
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9537038207, green: 0.9007150531, blue: 0.8663603067, alpha: 1))
            
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    HStack {
                        Button(action: {self.date = self.date == 0 ? 1 : 0; getWeatherData()}){
                            Text(self.date == 0 ? "Today" : "Tomorrow")
                        }
                        Text("will be . . .")
                    }
                        .foregroundColor(Color(#colorLiteral(red: 0.7351343036, green: 0.4217042029, blue: 0.3151755035, alpha: 1)))
                    HStack{
                        Spacer()
                        VStack {
                            Image(systemName: "sunrise")
                            Text("\(self.morn, specifier: "%.0f")")
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.6688631177, green: 0.7432201505, blue: 0.7593709826, alpha: 1)))
                        Spacer()
                        VStack {
                            Image(systemName: "sun.max")
                            Text("\(self.day, specifier: "%.0f")")
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                        Spacer()
                        VStack {
                            Image(systemName: "sunset")
                            Text("\(self.eve, specifier: "%.0f")")
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.9990305305, green: 0.5842646956, blue: 0, alpha: 1)))
                        Spacer()
                        VStack {
                            Image(systemName: "moon")
                            Text("\(self.night, specifier: "%.0f")")
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.7351343036, green: 0.4217042029, blue: 0.3151755035, alpha: 1)))
                        Spacer()
                    }
                    HStack {
                        Spacer()
                            Text("\(self.description.capitalized)")
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.4797514677, blue: 0.9984372258, alpha: 1)))
                        Spacer()
                        Text("\(self.rain, specifier: "%.1f")mm")
                            .foregroundColor(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                        Spacer()
                        Text("\(self.weatherType.capitalized)")
                            .foregroundColor(Color(#colorLiteral(red: 0.9990305305, green: 0.5842646956, blue: 0, alpha: 1)))
                        Spacer()
                    }
                    .font(.custom("sweet purple", size: 40))
                    .opacity(0.5)
                }
                .padding()
                .font(.custom("sweet purple", size: 50))
                .foregroundColor(.white)
                .animation(.easeInOut)
                
                VStack{
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 16)],spacing: 16) {
                            ForEach(clothing) { clothing in
                                if clothing.weather.contains(self.weatherType) {
                                    ClothingCell(clothing: clothing)
                                        .frame(maxWidth: 100)
                                }
                            }
                        }
                        .animation(.easeInOut)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text(self.suggestion)
                        .foregroundColor(Color(#colorLiteral(red: 0.5004656911, green: 0.3363116682, blue: 0.716204226, alpha: 1)))
                        .font(.custom("sweet purple", size: 40))
                        .multilineTextAlignment(.center)
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
            ContentView(clothing: clothingTypes
            ).previewDevice("iPhone 11")
        }
    }
}


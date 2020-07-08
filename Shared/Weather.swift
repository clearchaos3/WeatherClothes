//
//  Weather.swift
//  WeatherClothes
//
//  Created by Ryan Lee on 7/6/20.
//

import SwiftUI

struct Feels_Like : Decodable {
    let morn: Float?
    let day: Float?
    let eve: Float?
    let night: Float?
}

struct Weather : Decodable {
    let description: String?
    let weatherType: String?
}

struct Daily : Decodable {
    let feels_like : Feels_Like?
    let weather : [Weather]?
}

struct JSON : Decodable {
    let daily: [Daily]?
}


struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

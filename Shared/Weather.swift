//
//  Weather.swift
//  WeatherClothes
//
//  Created by Ryan Lee on 7/6/20.
//

import SwiftUI

struct Temp : Decodable {
    let min: Float?
    let max: Float?
}

struct Weather : Decodable {
    let description: String?
}

struct Daily : Decodable {
    let temp : Temp?
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

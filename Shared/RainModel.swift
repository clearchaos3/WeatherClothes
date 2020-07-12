//
//  RainModel.swift
//  WeatherClothes
//
//  Created by Ryan Lee on 7/12/20.
//

import SwiftUI

struct Rain : Decodable, Equatable {
    let oneh : Float?
    private enum CodingKeys : String, CodingKey { case oneh = "1h"}
}



struct Hourly : Decodable {
    let rain : Rain?
}

struct RainJSON : Decodable {
    let hourly: [Hourly]?
}


struct RainModel_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}


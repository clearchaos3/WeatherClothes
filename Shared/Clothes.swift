//
//  Clothes.swift
//  WeatherClothes
//
//  Created by Ryan Lee on 7/6/20.
//


import SwiftUI

struct Clothing: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var weather: [String]
}

var clothingTypes = [
    Clothing(name: "T-Shirt", imageName: "011-shirt", weather: ["hot","warm","fair"]),
    Clothing(name: "Long Sleeve", imageName: "011-shirt", weather: ["fair","cold"]),
    Clothing(name: "Sweater", imageName: "011-shirt", weather: ["cold","freezing"]),
    Clothing(name: "Jacket", imageName: "011-shirt", weather: ["fair","cold"]),
    Clothing(name: "Coat", imageName: "011-shirt", weather: ["cold","freezing"]),
    
    Clothing(name: "Dress", imageName: "025-jeans", weather: ["hot","warm"]),
    Clothing(name: "Jeans", imageName: "025-jeans", weather: ["warm","fair"]),
    Clothing(name: "Shorts", imageName: "025-jeans", weather: ["hot","warm"]),
    Clothing(name: "Skirt", imageName: "025-jeans", weather: ["hot","warm"]),
    
    Clothing(name: "Sneakers", imageName: "111-pamela", weather: ["hot", "warm", "fair", "cold"]),
    Clothing(name: "Sandals", imageName: "111-pamela", weather: ["hot", "warm", "fair"]),
    Clothing(name: "Boots", imageName: "111-pamela", weather: ["fair", "cold", "freezing"]),
    
    
    Clothing(name: "Sun Hat", imageName: "111-pamela", weather: ["hot", "warm"]),
    Clothing(name: "Sunglasses", imageName: "111-pamela", weather: ["hot", "warm"])
]

struct Clothes_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

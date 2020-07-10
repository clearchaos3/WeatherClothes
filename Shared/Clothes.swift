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
    Clothing(name: "T-Shirt", imageName: "tshirt", weather: ["hot","warm","fair"]),
    Clothing(name: "Hoodie", imageName: "hoodie", weather: ["fair","cold"]),
    
    Clothing(name: "Jeans", imageName: "jeans", weather: ["warm","fair"]),
    Clothing(name: "Shorts", imageName: "shorts", weather: ["hot","warm"]),
    Clothing(name: "Skirt", imageName: "skirt", weather: ["hot","warm"]),
    
    Clothing(name: "Sneaker", imageName: "sneaker", weather: ["hot", "warm", "fair", "cold"]),
    Clothing(name: "Flip Flops", imageName: "flipflops", weather: ["hot", "warm"]),
    Clothing(name: "Boots", imageName: "boots", weather: ["cold", "freezing"]),
    
    Clothing(name: "Hat", imageName: "hat", weather: ["hot", "warm", "fair"]),
    Clothing(name: "Snow Hat", imageName: "snowhat", weather: ["cold", "freezing"]),
    
    Clothing(name: "Sunglasses", imageName: "sunglasses", weather: ["hot", "warm"])
]

struct Clothes_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

//
//  Clothes.swift
//  WeatherClothes
//
//  Created by Ryan Lee on 7/6/20.
//


import Foundation

struct Clothing: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
}

let testData = [
    Clothing(name: "T-Shirt", imageName: "011-shirt"),
    Clothing(name: "Jeans", imageName: "025-jeans"),
    Clothing(name: "Sun Hat", imageName: "111-pamela"),
    Clothing(name: "T-Shirt", imageName: "011-shirt"),
    Clothing(name: "Jeans", imageName: "025-jeans"),
    Clothing(name: "Sun Hat", imageName: "111-pamela")
]

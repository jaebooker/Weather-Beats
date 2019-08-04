//
//  Weather.swift
//  WeatherBeats
//
//  Created by Jaeson Booker on 8/2/19.
//  Copyright © 2019 Jaeson Booker. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var coord: Coord
    var weather: [WeatherDescription]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coord: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherDescription: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct Main: Decodable {
    var temp: Double
    var pressure: Int
    var humidity: Int
    var temp_min: Double
    var temp_max: Double
}

struct Wind: Decodable {
    var speed: Float
    var deg: Float
}

struct Clouds: Decodable {
    
}

struct Sys: Decodable {
    var type: Int
    var id: Int
    var message: Float
    var country: String
    var sunrise: Int
    var sunset: Int
}

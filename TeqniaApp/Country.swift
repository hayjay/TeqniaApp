//
//  Country.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 27/04/2020.
//  Copyright © 2020 Nurudeen Ajayi. All rights reserved.
//

import Foundation

struct Country : Decodable {
    var name: String? //optional
    var capital: String?
    var countryCode : String?
    
    //Here, we are making our class properties (name,capital and countryCode) to conform with the api response keys
    enum CodingKeys : String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3C ode"
    }
}

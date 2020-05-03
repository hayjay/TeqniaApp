//
//  Customer.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 27/04/2020.
//  Copyright © 2020 Nurudeen Ajayi. All rights reserved.
//

import Foundation

struct Customer : Decodable {
    var name : String?
    var email : String?
    var password : String?
    var phone : String?
    var gender : String?
    var alt_address : String?
    var address : String?
    var package_id : UInt?
    var amount : Float?
    var payment_status : String?
    var mode_of_payment : String?
    var payment_reference : String?
    
    enum CodingKeys : String, CodingKey {
        case name = "name"
        case email = "email"
        case password = "password"
        case phone = "phone_number"
        case gender = "gender"
        case alt_address = "alt_address"
        case address = "address"
        case package_id = "package_id"
        case amount = "amount"
        case payment_status = "payment_status"
        case mode_of_payment = "mode_of_payment"
        case payment_reference = "payment_reference"
    }
    
    
    
}

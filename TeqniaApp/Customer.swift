//
//  Customer.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 27/04/2020.
//  Copyright © 2020 Nurudeen Ajayi. All rights reserved.
//

import Foundation

struct ApiResponse : Codable {
    let message : String?
    let code : Int?
    let status : Bool?
    let data : DependentModel?
}

struct DependentModel : Codable {
    let token : String?
    let customer : Customer?
}

struct Customer : Codable {
    var name : String?
    var email : String?
    var password : String?
    var phone : String?
    var gender : String?
    var alt_address : String?
    var address : String?
//    var package_id : String?
//    var amount : String?
//    var payment_status : String?
//    var mode_of_payment : String?
//    var payment_reference : String?
    
    enum CodingKeys : String, CodingKey {
        case name = "name"
        case email = "email"
        case password = "password"
        case phone = "phone_number"
        case gender = "gender"
        case alt_address = "alt_address"
        case address = "address"
//        case package_id = "package_id"
//        case amount = "amount"
//        case payment_status = "payment_status"
//        case mode_of_payment = "mode_of_payment"
//        case payment_reference = "payment_reference"
    }
    
    
//    {
//        "status": true,
//        "code": 201,
//        "message": "Customer registration successful!",
//        "data": {
//            "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiIzMzIiLCJ1c2VyX2VtYWlsIjoiYWtvc2lraHNkamRtQGdtYWlsLmNvbXNzZGQiLCJpYXQiOjE1ODkwMjY1NTcsImV4cCI6MTU4OTYzMTM1N30.7X8JiGHTScJdUXkEzASqO1N4F-wEnHLU3XuuFkdrR48",
//            "customer": {
//                "id": 332,
//                "name": "Kosim Kamoru",
//                "email": "akosikhsdjdm@gmail.comssdd",
//                "password": "$2a$10$JcM2IUc8cJ0wbRUZCT7Vsew0U22HBVke.JnKd9oHJMIXMeZ/tweh2",
//                "phone_number": "07011226541",
//                "gender": "Male",
//                "address": "33, Odewale Street. Abuja Nigeria.",
//                "alt_address": "Block 34. No. 33, Odewale Street. Abuja Nigeria.",
//                "role_id": 3,
//                "updatedAt": "2020-05-09T12:15:57.113Z",
//                "createdAt": "2020-05-09T12:15:57.113Z"
//            }
//        }
//    }
}

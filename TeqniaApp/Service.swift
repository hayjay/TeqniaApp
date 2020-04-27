//
//  Service.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 27/04/2020.
//  Copyright © 2020 Nurudeen Ajayi. All rights reserved.
//

import Foundation
import Alamofire

class Service {
    fileprivate var baseUrl = ""
    
    init(baseUrl : String) {
        self.baseUrl = baseUrl
    }
    
    //MARK:- getAllCountryNameFrom
    func getAllCountryName(endpoint : String) {
        AF.request(self.baseUrl + endpoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
//            print("We got the response")
            guard let data = responseData.data else {return}
            
            //JSONDecoder.decode takes our country model as its parameter which needs to be decoded
            do {
                // [Country.self] in square bracket means our response format from the API comes inform of objects/dictionaries
                let countries = try JSONDecoder().decode([Country].self, from : data)
                
                print("countries == \(countries)")
            } catch {
                print("Error decoding == \(error)")
            }
            
        }
    }
}

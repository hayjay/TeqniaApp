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
    typealias countriesCallBack = (_ countries:[Country]?, _ status: Bool, _ message:String) -> Void
    typealias customerCallBack = (_ customer:Customer?, _ status: Bool, _ message:String) -> Void

    var callBack:countriesCallBack?
    var customerCallBack:customerCallBack?
    
    init(baseUrl : String) {
        self.baseUrl = baseUrl
    }
    
    //MARK:- customerSignup
    func newCustomer(endPoint : String, parameters : Dictionary<String, Any>) {
            AF.request(self.baseUrl + endPoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON { (responseData) in
                print(responseData)
                guard let data = responseData.data else
                {
                    
                    self.customerCallBack?(nil, false, "")
                    return
                }
//                print(data)
                
            
            do {
                let customer = try JSONDecoder().decode(Customer.self, from: data)
                
                
                self.customerCallBack?(customer, true,"")
//                print("Name : \(String(describing: customer.name))")
                
//                print("customer == \(customer)")
                
                
            } catch {
                print("Error decoding == \(error)")
                self.customerCallBack?(nil, false, error.localizedDescription)
                
            }
        }
    }
        
    
    func completionHandler(callBack: @escaping countriesCallBack) {
        self.callBack = callBack
    }
    
    func customerCompletionHandler(callBack: @escaping customerCallBack) {
        self.customerCallBack = callBack
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

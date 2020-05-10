//
//  CustomerSignupViewController.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 18/02/2020.
//  Copyright © 2020 Nurudeen Ajayi. All rights reserved.
//

import UIKit
//make sure u include var window: UIWindow? to app.delegate
import SVProgressHUD

class CustomerSignupViewController: UIViewController {
    
    @IBOutlet var fullname: UITextField!
    @IBOutlet var email: UITextField!
    
    @IBOutlet var phone: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var confirm_password: UITextField!
    var customer: ApiResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //instantiate the api service class
        
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        let service = Service(baseUrl: "http://localhost:8040/")
        let random_str = service.randomString(length: 5)
        service.newCustomer(
                    endPoint: "customer/create",
                    parameters: [
                        "name" : "Hayjay", "email" : random_str+"@sa.hcom", "password": "password", "phone_number": "09033333394", "gender": "Male", "alt_address": "address", "address": "33, Akinfunle street VI Lagos", "package_id" : 3, "amount" : 40000, "payment_status" : "success", "mode_of_payment" : "Online", "payment_reference" : 2093293
                    ]
        )
        service.customerCompletionHandler { [weak self] (customer, status, message) in
            if status {
                guard let self = self else{return}
                guard let _customer = customer else{return}
                
                self.customer = _customer
                
                self.customerCreated()
                SVProgressHUD.dismiss()
            }
        }
        
            
//        print(self.customer ?? "Data could not be fetched")
            //print("done")
            //SVProgressHUD.show()
            //MAKE NETWORK CALL TO OUR API
     }
    
    func customerCreated(){
        if self.customer?.status == true {
            print(self.customer?.message ?? "No success message")
            print(self.customer?.data?.customer?.email ?? "No email value returned")
            print(self.customer?.data?.token ?? "No token responded")
            print(self.customer ?? "I no see anything o")
        }
    }
}
